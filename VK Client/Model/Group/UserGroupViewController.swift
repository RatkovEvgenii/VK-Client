//
//  UserGroupViewController.swift
//  VK Client
//
//  Created by Admin on 02.01.2021.
//

import UIKit

class UserGroupViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    var groups = [String]()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupID", for: indexPath) as! GroupCell
        let groupName = filteredGroups[indexPath.row]

        cell.groupName.text = groupName
        cell.groupIcon.image = UIImage(named: "groupIcon")

        return cell
    }
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroup" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let allGroupsController = segue.source as? AllGroupTableViewController else { return }
            // Получаем индекс выделенной ячейки
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                // Получаем город по индексу
                let group = allGroupsController.groups[indexPath.row]
                // Проверяем, что такого города нет в списке
                if !groups.contains(group) {
                    // Добавляем город в список выбранных
                    groups.append(group)
                    filteredGroups = groups
                    // Обновляем таблицу
                    tableView.reloadData()
                }
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {// Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
        // Удаляем город из массива
            groups.remove(at: indexPath.row)
        // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }

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
