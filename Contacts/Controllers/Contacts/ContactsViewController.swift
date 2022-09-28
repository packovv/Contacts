//
//  ContactsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit
import SnapKit

class ContactsViewController: UITableViewController {
    
    private var entities: [ContactEntity] = []
    private var contactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsViewCell.reuseId, for: indexPath) as! ContactsViewCell

        let contact = contactList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.surname
        content.secondaryText = contact.name
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = ContactDetailsViewController(contact: contactList[indexPath.row])
        show(detailsViewController, sender: nil)
    }
    
    @objc private func addNewTask() {

        
        
    }
    
    private func save(contactName: String) {
        StorageManager.shared.save(name: "", surname: "", email: "", phone: "") { task in
            self.entities.append(task)
            self.tableView.insertRows(
                at: [IndexPath(row: self.entities.count - 1, section: 0)],
                with: .automatic
            )
        }
    }

    private func fetchData() {
        StorageManager.shared.fetchData { result in
            switch result {
            case .success(let tasks):
                self.entities = tasks
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UI
extension ContactsViewController {
    
    private func getContactList() {
        for _ in 0..<20 {
            self.contactList.append(Contact.init())
        }
    }
    
    private func setUI() {
        self.tableView.register(ContactsViewCell.self, forCellReuseIdentifier: ContactsViewCell.reuseId)
        getContactList()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
    }
}
