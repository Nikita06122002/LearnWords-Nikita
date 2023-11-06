//
//  Unsplash-Network.swift
//  LearnWords-Nikita
//
//  Created by macbook on 05.11.2023.
//

import Foundation

extension Network {
    func getPhotos(text: String, completion: @escaping (Unsplash?, NetworkError?) -> Void) {
        let api = Api.downloadImage(string: text)

        push(api: api, type: Unsplash.self) { result in
            switch result {
            case .succes(let model): completion(model, nil)
            case .failure(let error): completion(nil, error)
            }
        }
        
        
    }
}
