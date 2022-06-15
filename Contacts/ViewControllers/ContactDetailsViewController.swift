//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    private func setUI() {
        nameLabel.text = contact.name
        surnameLabel.text = contact.surname
        phoneLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
    }

}
