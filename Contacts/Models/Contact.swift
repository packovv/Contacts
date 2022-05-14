//
//  Contact.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import Foundation

struct Contact {
    var name: String
    var surname: String
    var phoneNumber: String
    var email: String
    
    init() {
        name = ""
        surname = ""
        phoneNumber = ""
        email = ""
    }
}

enum contactTypes {
    case name
    case surname
    case phoneNumber
    case email
}
