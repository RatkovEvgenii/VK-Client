//
//  AllGroupTableViewController.swift
//  VK Client
//
//  Created by Admin on 02.01.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var groups = ["GeekBrains", "Наука и Техника", "ОБЖ",
        "ИТ мемасики", "Готовить легко!"," Хочу все знать"]
    
    var filteredGroups: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filteredGroups = groups

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addNewGroup", for: indexPath) as! AllGroupViewCell
        
        let name = filteredGroups[indexPath.row]
        cell.groupName.text = name
        cell.groupIcon.image = UIImage(named: "groupIcon")

        return cell
    }
    // MARK: - Search bar settings
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredGroups = []

        if searchText == "" {
            filteredGroups = groups
        } else {
            for group in groups {
                if group.lowercased().contains(searchText.lowercased()) {
                    filteredGroups.append(group)
                    
                }
            }
        }
        
        self.tableView.reloadData()
    }
    @objc func hideKeyboard() {
        //self.searchBar.resignFirstResponder()
        self.view.endEditing(true)
        
    }
}
