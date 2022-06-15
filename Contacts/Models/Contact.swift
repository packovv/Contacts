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
        self.name = randomName()
        self.surname = randomName()
        self.phoneNumber = randomPhoneNumber()
        self.email = randomEmail()
    }
    
    init(name: String, surname: String, phoneNumber: String, email: String) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

//extension Contact {
//    
//    func generateContact() -> Contact {
//        let contact: Contact = Contact.init(name: randomName(), surname: randomName(), phoneNumber: randomPhoneNumber(), email: randomEmail())
//        return contact
//    }
//}

enum contactTypes {
    case name
    case surname
    case phoneNumber
    case email
}
