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
    
    func getPhotos(text: String, completion: @escaping (_ array: [String]) -> Void) {

        var request = URLRequest(url: URL(string: "https://api.unsplash.com/search/photos?page=1&per_page=5&query=auto")!,timeoutInterval: Double.infinity)
        request.addValue("v1", forHTTPHeaderField: "Accept-Version")
        request.addValue("Client-ID O5QQH8N1gGUGmOnRjeATyCKINVj1mEfrQ0JFzqX8hOE", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}
