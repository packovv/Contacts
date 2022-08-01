//
//  Randomizer.swift
//  Contacts
//
//  Created by packovv on 14.05.2022.
//

import Foundation

// 1. Я бы убрал этот класс совсем, достаточно будет загрузки элементов из сети, здесь много моментов, к которым могут доебаться - лучше не давать лишнего повода
// 2. Если оставляешь - сделай класс final class, чтобы запретить наследование от него
class Randomizer {
    static let shared = Randomizer()
    
    private let numbers: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
    private let lowLetters: [Character] = ["a","b","c","d","e","f","g","h","i","j","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    private let highLetters: [Character] = ["A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    func randomName() -> String {
        let random = Int.random(in: 3...9)
        
        var name: String = ""

        // Лучше избегать циклов, может, можно написать в функциональном стиле?
        // Очевидно ли что такое n?
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

        // Давай переименуем n во что-то более очевидное и понятное?
        for n in 0...9 {
            // По-хорошему можно вынести весь switch в отдельный метод и дергать его в цикле, передавая параметр n, чтобы не запутаться во вложенности блоков кода
            switch n {
            case 0:
                phoneNumber.append("(")
            case 3:
                phoneNumber.append(")")
            case 6, 8:
                phoneNumber.append("-")
            default: break
            }
            // Раз уж мы каждый раз снова проходим цикл, то стоит Int.random(in: 0...9) вынести в отдельную переменную внутри цикла, чтобы вычисления не были внутри сабскрипта массива, лучше ему просто передавать готовое число
            phoneNumber.append(numbers[Int.random(in: 0...9)])
        }
        return phoneNumber
    }

    func randomEmail() -> String{
        let symbols = numbers + lowLetters + highLetters
        let random = Int.random(in: 4...8)
        
        var email: String = ""
        
        for _ in (1...random) {
            // Также, как в методе выше с random
            email.append(symbols[Int.random(in: 0...34)])
        }
        email.append("@mail.com")
        
        return email
    }
}

