//
//  Users.swift
//  Contacts
//
//  Created by packovv on 02.07.2022.
//

import Foundation

// А почему все св-ва опциональные? Это в API так задумано?

struct User: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat, lng: String?
}

struct Company: Codable {
    let name, catchPhrase, bs: String?
}

// Необязательно, можно потом и [User], в этом нет ничего такого
typealias Users = [User]
