//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit
import SnapKit

class ContactDetailsViewController: UIViewController {
    
    var selfContact = Contact()
    var selfImage = UIImage(systemName: "bookmark")!
    
    init(contact: Contact, image: UIImage) {
        selfContact = contact
        selfImage = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        
        contactImage.image = selfImage
        nameLabel.text = selfContact.name
        surnameLabel.text = selfContact.surname
        phoneLabel.text = selfContact.phoneNumber
        emailLabel.text = selfContact.email
    }
}
