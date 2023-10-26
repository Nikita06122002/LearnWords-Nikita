//
//  Network.swift
//  LearnWords-Nikita
//
//  Created by macbook on 14.10.2023.
//

import Foundation

protocol NetworkProtocol {
    var test: Bool { get }
    //    func getData()
}

final class Network: NetworkProtocol {
    
    var test: Bool
    
    static var shared = Network()
    private init() {
        test = true
    }
    
    func getPhotos(text: String, completion: @escaping (Unsplash?, Error?) -> Void) {
        
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=30&query=\(text)"
          
          // Создайте URL из строки
          guard let url = URL(string: urlString) else {
              print("Ошибка создания URL")
              return
          }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.addValue("v1", forHTTPHeaderField: "Accept-Version")
        request.addValue("Client-ID \(SecretKeys.unsplash.rawValue)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "--")
                print(String(describing: error))
                completion(nil, error)
                return
            }
            let decode = JSONDecoder()
            
            guard let value = try? decode.decode(Unsplash.self, from: data) else {
                completion(nil, error)
                print("Ошибка в getPhotos")
                return
            }
            
            completion(value, nil)
            
            print(value)
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
}
