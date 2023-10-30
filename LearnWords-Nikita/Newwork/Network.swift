//
//  Network.swift
//  LearnWords-Nikita
//
//  Created by macbook on 14.10.2023.
//

import Foundation

final class Network: NetworkProtocol {
    
    var test: Bool
    
    static var shared = Network()
    private init() {
        test = true
    }
    
    func getPhotos(text: String, completion: @escaping (Unsplash?, NetworkError?) -> Void) {
        let api = Api.downloadImage(string: text)
        let string = api.path
          
          // Создание URL из строки
          guard let url = URL(string: string) else {
              print("Ошибка создания URL")
              completion(nil, .notFoundUrl)
              return
          }
        
        var request = URLRequest(url: url,timeoutInterval: 10.0)
        
        api.header.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        request.httpMethod = api.method
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "--")
                print(String(describing: error))
                completion(nil, .error(error))
                return
            }
            let decode = JSONDecoder()
            
            guard let value = try? decode.decode(Unsplash.self, from: data) else {
                completion(nil, .error(error))
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
