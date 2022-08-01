//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

// Стоит написать final class
class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    // Не будет ли здесь когда-нибудь краша из-за worce unwrapping?
    var contact: Contact!
    // Непонятно что несет в себе название переменной, может, переименовать в какой-то более очевидный вариант?
    var thisImage: UIImage = UIImage(systemName: "bookmark")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        contactImage.image = thisImage
        nameLabel.text = contact.name
        surnameLabel.text = contact.surname
        phoneLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
    }
}
