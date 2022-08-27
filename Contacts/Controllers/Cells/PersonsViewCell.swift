//
//  PersonsViewCell.swift
//  Contacts
//
//  Created by packovv on 18.07.2022.
//

import UIKit

final class PersonsViewCell: UITableViewCell {

//    @IBOutlet weak var idLabel: UILabel!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var usernameLabel: UILabel!
//    @IBOutlet weak var emailLabel: UILabel!
    
    static let reuseId: String = "personsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configCell(id: String, name: String, username:
//                    String, email: String) {
//        idLabel.text = id
//        nameLabel.text = name
//        usernameLabel.text = username
//        emailLabel.text = email
//    }

}
