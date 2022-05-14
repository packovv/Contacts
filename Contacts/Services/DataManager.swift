//
//  DataManager.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import Foundation

var contacts: [Contact] = []

func setContacts(len: Int) {
    for _ in 0...len {
        contacts.append(randomContact())
    }
}


