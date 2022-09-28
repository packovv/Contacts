//
//  APIManager.swift
//  Contacts
//
//  Created by packovv on 02.07.2022.
//

import Foundation

enum pics: String {
    case cat1 = "https://miro.medium.com/max/1200/1*BomiWkQi5XB5A4KpQziJpw.jpeg"
    case cat2 = "https://lookw.ru/8/828/1476173549-33711.jpg"
    case cat3 = "https://i.pinimg.com/originals/94/67/be/9467bed789c3643422001718f9d90f53.jpg"
    case cat4 = "https://wallup.net/wp-content/uploads/2019/09/649150-cat-cats-feline-eyes.jpg"
}

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
    
    func fetchImage(pic: String) -> Data? {
//        let api = "https://picsum.photos/280/280"
        let api = pic
        guard let url = URL(string: api) else { return nil }
        return try? Data(contentsOf: url)
    }
}
