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
    
    func getImage(complition: @escaping (UIImage) -> Void) {

        let api = "https://picsum.photos/280/280"
        guard let url = URL(string: api) else { fatalError("doesn't get image from api") }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                complition(UIImage(data: data)!)
            } else {
                complition(UIImage(systemName: "bookmark")!)
            }

        }
        task.resume()
    }
}
