//
//  Randomizer.swift
//  Contacts
//
//  Created by packovv on 14.05.2022.
//

import Foundation

final class Randomizer {
    static let shared = Randomizer()
    
    private let numbers: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
    private let lowLetters: [Character] = ["a","b","c","d","e","f","g","h","i","j","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    private let highLetters: [Character] = ["A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    func randomName() -> String {
        let random = Int.random(in: 2...4)
        
        var name: String = ""
        
        for n in (0...random) {
            if n == 0 {
                name.append(highLetters[Int.random(in: 0...24)])
                continue
            }
            name.append(lowLetters[Int.random(in: 0...24)])
        }
        return name
    }

    func randomPhoneNumber() -> String {
        var phoneNumber: String = "+7"
        
        for n in 0...9 {
            switch n {
            case 0:
                phoneNumber.append("(")
            case 3:
                phoneNumber.append(")")
            case 6, 8:
                phoneNumber.append("-")
            default: break
            }
            phoneNumber.append(numbers[Int.random(in: 0...9)])
        }
        return phoneNumber
    }
}

