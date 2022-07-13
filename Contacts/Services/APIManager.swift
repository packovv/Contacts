//
//  APIManager.swift
//  Contacts
//
//  Created by packovv on 02.07.2022.
//

import Foundation
import UIKit

enum APIType {
    case login
    case getUsers
    case getPosts
    case getAlbums
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
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
        }
    }
    
    var request: URLRequest {
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
}

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
