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
        
        var request = URLRequest(url: URL(string: "https://api.unsplash.com/search/photos?page=1&per_page=30&query=auto")!,timeoutInterval: Double.infinity)
        request.addValue("v1", forHTTPHeaderField: "Accept-Version")
        request.addValue("Client-ID \(SecretKeys.unsplash.rawValue)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "--")
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            
            guard let value = try? decoder.decode(Unsplash.self, from: data) else {
                completion(nil, error)
                print("Opps, Плохой программист")
                return
            }
            
            completion(value, nil)
        }
        
        task.resume()
        
    }
}
