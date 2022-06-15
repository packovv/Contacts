//
//  ContactsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

class ContactsViewController: UITableViewController {
    var contactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContactList()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactListCell", for: indexPath)

        let contact = contactList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.surname
        content.secondaryText = contact.name
        
        cell.contentConfiguration = content
        return cell
    }
    
    private func getContactList() {
        for _ in 0...20 {
            self.contactList.append(Contact.init())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ContactDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let contact = contactList[indexPath.row]
        vc.contact = contact
        //vc.contact = sender as? Contact
    }
}
