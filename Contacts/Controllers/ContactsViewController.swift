//
//  ContactsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

// Стоит написать final class
class ContactsViewController: UITableViewController {
        
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    private var contactList: [Contact] = []
    private var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContactList()
        setImages()
    }

    // В новом Swift если в блоке пишется только одна строка и метод что-то возвращает, то можно не писать return
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ContactDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let contact = contactList[indexPath.row]
        vc.contact = contact
        vc.thisImage = images[indexPath.row]
    }
}

extension ContactsViewController {
    
    private func setupActivityIndicator() {
        // Мне кажется, что здесь self необязательно писать, потому что у тебя однозначно понятно откуда берется view, как думаешь?
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    private func startActivityIndicator() {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    private func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    private func getContactList() {
        for _ in 0...20 {
            self.contactList.append(Contact.init())
        }
    }
    
    private func setImages() {
        startActivityIndicator()
        for _ in 0..<contactList.count {
            APIManager.shared.getImage { [weak self] image in
                DispatchQueue.main.async {
                    self?.images.append(image)
                    self?.stopActivityIndicator()
                }
            }
        }
    }
}
