//
//  ContactsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit
import SnapKit

class ContactsViewController: UITableViewController {
        
    private let detailsViewController = ContactDetailsViewController()
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
//        show(detailsViewController, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ContactDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let contact = contactList[indexPath.row]
        vc.contact = contact
        vc.image = images[indexPath.row]
    }
}

extension ContactsViewController {
    
    private func getContactList() {
        for _ in 0...20 {
            self.contactList.append(Contact.init())
        }
    }
    
    private func setImages() {
        activityIndicator.startActivityIndicator(view)
        for _ in 0..<contactList.count {
            APIManager.shared.getImage { [weak self] image in
                DispatchQueue.main.async {
                    self?.images.append(image)
                    self?.activityIndicator.stopActivityIndicator(self!.view)
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
