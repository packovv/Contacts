//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit
import SnapKit

class ContactDetailsViewController: UIViewController {
    
    private let activityIndicator = ActivityIndicatorView()
    private let contactImage = UIImageView()
    
    var selfContact: Contact!
    
    init(contact: Contact) {
        selfContact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        fetchImage()
    }
    
    private func setUI() {
        view.addSubview(contactImage)
        contactImage.snp.makeConstraints { maker in
            maker.width.equalTo(280)
            maker.height.equalTo(280)
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(100)
        }
        
        let nameLabel: UILabel = {
            let nameLabel = UILabel()
            view.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(20)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(contactImage).inset(300)
            }
            return nameLabel
        }()
        
        let surnameLabel: UILabel = {
            let surnameLabel = UILabel()
            view.addSubview(surnameLabel)
            surnameLabel.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(20)
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
                maker.height.equalTo(20)
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
                maker.height.equalTo(20)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(phoneLabel).inset(30)
            }
            return emailLabel
        }()
        
//        contactImage.image = selfImage ?? UIImage(systemName: "bookmark")!
//        contactImage.image = selfImage
        nameLabel.text = selfContact.name
        surnameLabel.text = selfContact.surname
        phoneLabel.text = selfContact.phoneNumber
        emailLabel.text = selfContact.email
    }
    
    private func fetchImage() {
        activityIndicator.startActivityIndicator(contactImage as UIView)
        DispatchQueue.global().async {
            guard let imageData = APIManager.shared.fetchImage() else { return }
            DispatchQueue.main.async {
                self.contactImage.image = UIImage(data: imageData)
                self.activityIndicator.stopActivityIndicator(self.view as UIView)
            }
        }
    }
}
