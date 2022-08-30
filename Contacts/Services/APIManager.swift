//
//  APIManager.swift
//  Contacts
//
//  Created by packovv on 02.07.2022.
//

import Foundation
import UIKit

final class APIManager {
    static let shared = APIManager()
    
    func fetchPersons(complition: @escaping (Persons) -> Void) {
        let api = "https://jsonplaceholder.typicode.com/"
        guard let url = URL(string: "users", relativeTo: URL(string: api)) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let persons = try? JSONDecoder().decode(Persons.self, from: data) {
                complition(persons)
            } else {
                complition([])
            }
        }
        task.resume()
    }
    
    func fetchImage() -> Data? {
        let api = "https://picsum.photos/280/280"
        guard let url = URL(string: api) else { return nil }
        return try? Data(contentsOf: url)
    }
}
