//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit
import SnapKit

class ContactDetailsViewController: UIViewController {
    
    var contact = Contact()
    var image = UIImage(systemName: "bookmark")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        let contactImage: UIImageView = {
            let contactImage = UIImageView()
            view.addSubview(contactImage)
            contactImage.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(280)
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview().inset(100)
            }
            return contactImage
        }()
        
        let nameLabel: UILabel = {
            let nameLabel = UILabel()
            view.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(280)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(contactImage).inset(160)
            }
            return nameLabel
        }()
        
        let surnameLabel: UILabel = {
            let surnameLabel = UILabel()
            view.addSubview(surnameLabel)
            surnameLabel.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(280)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(nameLabel).inset(30)
            }
            return surnameLabel
        }()
        
        let phoneLabel: UILabel = {
            let phoneLabel = UILabel()
            view.addSubview(phoneLabel)
            phoneLabel.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(280)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(surnameLabel).inset(30)
            }
            return phoneLabel
        }()
        
        let emailLabel: UILabel = {
            let emailLabel = UILabel()
            view.addSubview(emailLabel)
            emailLabel.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(280)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(phoneLabel).inset(30)
            }
            return emailLabel
        }()
        
        contactImage.image = image
        nameLabel.text = contact.name
        surnameLabel.text = contact.surname
        phoneLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
    }
}
