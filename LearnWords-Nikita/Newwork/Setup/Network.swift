//
//  Network.swift
//  LearnWords-Nikita
//
//  Created by macbook on 14.10.2023.
//

import Foundation

final class Network: NetworkProtocol {
    
    static var shared = Network()
    private init() { }
    
    func push<T:Decodable>(api: Api, type: T.Type, completion: @escaping (Result<T>) -> Void) {
        let string = api.path
          
        // Создание URL из строки
        guard let url = URL(string: string) else {
            print("Ошибка создания URL")
            completion(Result.faulure(error: .notFoundUrl))
            return
        }
      
      var request = URLRequest(url: url,timeoutInterval: 10.0)
      
      api.header.forEach { (key: String, value: String) in
          request.addValue(value, forHTTPHeaderField: key)
      }
      
      request.httpMethod = api.method
      
      let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data, let response = response as? HTTPURLResponse  else {
              print(error?.localizedDescription ?? "--")
              print(String(describing: error))
              completion(.faulure(error: .error(error)))
              return
          }
          let statusCode = response.statusCode
          
          if statusCode != 200 {
              //что то пошло не так. Можно обработать тут
          }
          
          let decode = JSONDecoder()
          
          guard let value = try? decode.decode(T.self, from: data) else {
              completion(.faulure(error: .error(error)))
              print("Ошибка в getPhotos")
              return
          }
          
          completion(.success(model: value))
      }
      
      task.resume()
    }
}
