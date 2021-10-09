//
//  FriendsViewController.swift
//  VK Client
//
//  Created by Admin on 02.01.2021.
//

import UIKit

class FriendsViewController: UITableViewController, UISearchBarDelegate {

    
    //var friends = ["Сергей Петров","Ольга Куликова","Яша Гогунский","Володя Собалев","Илья Кузьмин","Гриша Петренко","Настена Ивановна"]
    
    @IBOutlet weak var searchBar: UISearchBar!
    let contacts = [Contact (name: "Сергей Петров", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Ольга Куликова", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Яша Гогунский", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Володя Собалев", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Илья Кузьмин", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Гриша Петренко", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Настена Ивановна", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Вика Макорова", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Валентин Бузажи", icon: UIImage(named: "userIcon")!),
                    Contact (name: "Яков Матроскин", icon: UIImage(named: "userIcon")!),]
    var sections: [String: [Contact]] = [:]
    var keys: [String] = []
    var filteredContacts: [Contact] = []
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        filteredContacts = contacts
        searchBar.delegate = self
        configurateSectionsAndKeys()
//        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        self.view.addGestureRecognizer(hideKeyboardGesture)
       
    }
    
    func configurateSectionsAndKeys() {
        filteredContacts.forEach { contact in
            let firstLetter = String(contact.name.first!)
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
        cell.userName.text = contact.name
        cell.userAvatar.setImage(contact.icon)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detail") as! FriendCollectionViewController
        let key = keys[indexPath.section]
        let contact = sections[key]![indexPath.row]
        controller.userName = contact.name
        controller.userIcon = contact.icon
        show(controller, sender: nil)
    }
    // MARK: - Search bar settings
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContacts = []
        sections = [:]
        keys = []
        if searchText == "" {
            filteredContacts = contacts
        } else {
            for contact in contacts {
                if contact.name.lowercased().contains(searchText.lowercased()) {
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
    
}

