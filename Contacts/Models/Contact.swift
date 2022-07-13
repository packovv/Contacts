//
//  Contact.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import Foundation

struct Contact {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    
    var fullName: String { "\(name) \(surname)" }
    
    init() {
        self.name = Randomizer.shared.randomName()
        self.surname = Randomizer.shared.randomName()
        self.phoneNumber = Randomizer.shared.randomPhoneNumber()
        self.email = Randomizer.shared.randomEmail()
    }
    
    init(name: String, surname: String, phoneNumber: String, email: String) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
