//
//  APIManager.swift
//  Contacts
//
//  Created by packovv on 02.07.2022.
//

import Foundation
import UIKit

// Если используешь такой инам, то уж лучше сразу затащить Moya в проект, там такая же структура и сможешь избежать лишнего кода
enum APIType {
    case login
    case getUsers
    case getPosts
    case getAlbums
    case getImage
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    var imageURL: String {
        return "https://picsum.photos/280/280"
    }
    
    var header: [String: String] {
        switch self {
        case .login:
            return ["authToken": "123456"]
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .login: return "login"
        case .getUsers: return "users"
        case .getPosts: return "posts"
        case .getAlbums: return "albums"
        case .getImage: return "image"
        }
    }
    
    var request: URLRequest {
        // Может, стоит завести отдельную константу для URL(string: baseURL), чтобы не было вложенности и было комфортней читать?
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        
        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
    
    var imageRequest: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: imageURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        request.httpMethod = "GET"
        return request
    }
}

// Сделай класс final, чтобы от него нельзя было наследоваться
class APIManager {
    static let shared = APIManager()
    
    func getUsers(complition: @escaping (Users) -> Void) {
        let request = APIType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data) {
                complition(users)
            } else {
                complition([])
            }
        }
        task.resume()
    }

    // В целом для картинок лучше сразу поставить Kingfisher например, потому что там решено очень много проблем, которые обычно решаются костылями, например здесь не будет кэширования картинок, а это не очень хорошо
    func getImage(complition: @escaping (UIImage) -> Void) {

        // Для ссылок лучше завести отдельную структуру а-ля URLFactory, из которой подтянешь нужные ссылки
        let api = "https://picsum.photos/280/280"
        guard let url = URL(string: api) else { fatalError("doesn't get image from api") }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                // Можно ли как-то избавиться от force unwrapping?
                complition(UIImage(data: data)!)
            } else {
                complition(UIImage(systemName: "bookmark")!)
            }

        }
        task.resume()
    }
}
