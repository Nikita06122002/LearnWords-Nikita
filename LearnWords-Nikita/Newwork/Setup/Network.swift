//
//  Network.swift
//  LearnWords-Nikita
//
//  Created by macbook on 14.10.2023.
//

import Foundation

final class Network: NetworkProtocol {
    
    static var shared = Network()
    private init() {  }
    
    func push<T:Decodable>(api: Api, type: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        let string = api.path

        // Создание URL из строки
        guard let url = URL(string: string) else {
            print("Ошибка создания URL")
            completion(Result.failure(error: .notFoundUrl))
            return
        }
      
      var request = URLRequest(url: url,timeoutInterval: 10.0)
      
      api.header.forEach { (key: String, value: String) in
          request.addValue(value, forHTTPHeaderField: key)
      }
      
      request.httpMethod = api.method
      
      let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data, let response = response as? HTTPURLResponse else {
              print(error?.localizedDescription ?? "--")
              print(String(describing: error))
              completion(Result.failure(error: .error(error)))
              return
          }
          let statusCode = response.statusCode
          if statusCode != 200 {
              print("Что-то пошло не так")
              //что-то пошло не так, можно обработать здесь
          }
          let decode = JSONDecoder()
          
          guard let value = try? decode.decode(type, from: data) else {
              completion(Result.failure(error: .error(error)))
              print("Ошибка в getPhotos")
              return
          }
          
          completion(Result.succes(model: value))

      }
      
      task.resume()
      
    }
    
}
