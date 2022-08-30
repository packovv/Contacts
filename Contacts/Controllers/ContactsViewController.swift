//
//  ContactsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit
import SnapKit

class ContactsViewController: UITableViewController {
        
    private let activityIndicator = ActivityIndicatorView()
    
    private var contactList: [Contact] = []
    private var images: [UIImage] = []
    
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
        let detailsViewController = ContactDetailsViewController(contact: contactList[indexPath.row], image: images[indexPath.row])
        show(detailsViewController, sender: nil)
    }
}

extension ContactsViewController {
    
    private func getContactList() {
        for _ in 0..<20 {
            self.contactList.append(Contact.init())
        }
    }
    
    private func setImages() {
        activityIndicator.startActivityIndicator(view)
        for _ in 0..<contactList.count {
            DispatchQueue.global().async {
                guard let imageData = APIManager.shared.fetchImage() else { return }
                DispatchQueue.main.async {
                    self.images.append(UIImage(data: imageData)!)
                    self.activityIndicator.stopActivityIndicator(self.view)
                }
            }
        }
    }
    
    private func setUI() {
        self.tableView.register(ContactsViewCell.self, forCellReuseIdentifier: ContactsViewCell.reuseId)
        activityIndicator.setupActivityIndicator(view)
        getContactList()
        setImages()
    }
}
