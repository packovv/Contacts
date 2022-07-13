//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contact: Contact!
    var thisImage: UIImage = UIImage(systemName: "bookmark")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setImage()
        nameLabel.text = contact.name
        surnameLabel.text = contact.surname
        phoneLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
    }
    
//    private func getImage() {
//        let api = "https://picsum.photos/280/280"
//        guard let url = URL(string: api) else { fatalError("doesn't get image from api") }
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async {
//                self.image = UIImage(data: data)
//            }
//        }
//        task.resume()
//    }
    
    private func setImage() {
        APIManager.shared.getImage { [weak self] image in
            DispatchQueue.main.async {
                self?.thisImage = image
                self?.contactImage.image = self?.thisImage
            }
        }
    }

}
