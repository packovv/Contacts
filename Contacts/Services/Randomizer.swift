//
//  Randomizer.swift
//  Contacts
//
//  Created by packovv on 14.05.2022.
//

import Foundation

func randomContact() -> Contact {
    var contactTemp: Contact = Contact.init()
    
    contactTemp.name = randomName()
    contactTemp.surname = randomName()
    contactTemp.phoneNumber = randomPhoneNumber()
    contactTemp.phoneNumber = randomEmail()
    
    return contactTemp
}

private func randomName() -> String {
    let lowLetters: NSString = "abcdefghijlmnopqrstuvwxyz"
    let highLetters: NSString = "ABCDEFGHIJLMNOPQRSTUVWXYZ"
    
    let C = Array(arrayLiteral: highLetters)
    let c = Array(arrayLiteral: lowLetters)
    
    let random = Int.random(in: 4...10)
    
    var name: String = ""
    
    for n in (1...random) {
        if n == 1 {
            name.append(C[Int(arc4random()) % C.count] as String)
            continue
        }
        name.append(c[Int(arc4random()) % c.count] as String)
    }
    return name
}

private func randomPhoneNumber() -> String {
    let numbers: NSString = "0123456789"
    
    let c = Array(arrayLiteral: numbers)
    
    var phoneNumber: String = "+7"
    
    for _ in 1...9 {
        phoneNumber.append(c[Int(arc4random()) % c.count] as String)
    }
    
    return phoneNumber
}

private func randomEmail() -> String{
    let symbols: NSString = "abcdefghijlmnopqrstuvwxyz0123456789"
    
    let c = Array(arrayLiteral: symbols)
    
    let random = Int.random(in: 4...10)
    
    var email: String = ""
    
    for _ in (1...random) {
        email.append(c[Int(arc4random()) % c.count] as String)
    }
    
    email.append("@mail.com")
    
    return email
}
