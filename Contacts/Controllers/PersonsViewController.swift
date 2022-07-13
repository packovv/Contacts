//
//  PersonsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

class PersonsViewController: UITableViewController {

    private var thisUsers: Users = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.getUsers { [weak self] users in
            DispatchQueue.main.async {
                self?.thisUsers = users
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thisUsers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personsCell", for: indexPath)

        let user = thisUsers[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = user.name
        content.secondaryText = user.email
        cell.contentConfiguration = content
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
