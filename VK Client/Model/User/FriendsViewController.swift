//
//  FriendsViewController.swift
//  VK Client
//
//  Created by Admin on 02.01.2021.
//

import UIKit
import RealmSwift

class FriendsViewController: UITableViewController, UISearchBarDelegate {
    var requestToAPI = RequestToAPI()
    var friends: [Friend] = []
    var token: NotificationToken?
    
    @IBOutlet weak var searchBar: UISearchBar!

    var sections: [String: [Friend]] = [:]
    var keys: [String] = []
    var filteredContacts: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        let db = Database()
        
        //        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        //        self.view.addGestureRecognizer(hideKeyboardGesture)
        
        requestToAPI.setURL(url: setURL())
        requestToAPI.getResult(handler: { items in
            DispatchQueue.main.async{
                db.saveFriendData(items)
                self.friends = db.read()!
                self.filteredContacts = self.friends
                self.configurateSectionsAndKeys()
                self.tableView.reloadData()
                
              
            }
        })
        addTokenDatabase()
    }



    func configurateSectionsAndKeys() {
        filteredContacts.forEach { contact in
            let firstLetter = String(contact.first_name.first!)
            if sections[firstLetter] != nil {
                sections[firstLetter]!.append(contact)
            } else {
                sections[firstLetter] = [contact]
            }
        }
        keys = Array(sections.keys).sorted(by: <)
    }
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = keys[section]
        return key
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let count = sections[key]!.count
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdUserCell", for: indexPath) as! UserCell
        
        let key = keys[indexPath.section]
        let contact = sections[key]![indexPath.row]
        cell.userName.text = "\(contact.first_name) \(contact.last_name)"
        requestToAPI.getImage(by: contact.photo_100, handler: { (data) in
            let image = UIImage(data: data!)
            cell.userAvatar.setImage(image!)
        })
        if contact.online == 1 {
            cell.userAvatar.onlineShadow()
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detail") as! FriendCollectionViewController
        let key = keys[indexPath.section]
        let contact = sections[key]![indexPath.row]
        controller.userName = "\(contact.first_name) \(contact.last_name)"
        //controller.userIcon = contact.icon
        show(controller, sender: nil)
    }
    // MARK: - Search bar settings
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContacts = []
        sections = [:]
        keys = []
        if searchText == "" {
            filteredContacts = friends
        } else {
            for contact in friends {
                if contact.first_name.lowercased().contains(searchText.lowercased()) {
                    filteredContacts.append(contact)
                    
                }
            }
        }
        configurateSectionsAndKeys()
        self.tableView.reloadData()
    }
    @objc func hideKeyboard() {
        //self.searchBar.resignFirstResponder()
        self.view.endEditing(true)
        
    }
    
    func setURL() -> URL{
        // https://api.vk.com/method/friends.get?user_ids=53021558&access_token=df76ae8d37ef1d92dfac822559b63ecdb201cb4064b05b3eb4f6a76124de618f2b6580b418a58d00d1591&v=5.131
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            //URLQueryItem(name: "user_id", value: String(Session.instance.userID)),
            URLQueryItem(name: "fields", value: "photo_100,online"),
            //URLQueryItem(name: "count", value: "3"),
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "v", value: "5.131")
        ]
        print (urlComponents.url)
        return urlComponents.url!
    }
    
    func addTokenDatabase() {
        guard let realm = try? Realm() else { return }
        var listFriends = realm.objects(Friend.self)
        token = listFriends.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                tableView.beginUpdates()
            
//                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
//                                     with: .automatic)
//                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
//                                     with: .automatic)
//                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
//                                     with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
    
}

