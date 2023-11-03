//
//  Unsplash-Network.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 03.11.2023.
//

import Foundation
extension Network {
    
    func getPhotos(text: String, completion: @escaping (Unsplash?, NetworkError?) -> Void) {
        let api = Api.downloadImage(string: text)
        //1
//        push(api: api, type: Unsplash.self) { result, error in
//            return completion(result, error)
//        }
        
        //2
//        push(api: api, type: Unsplash.self, completion: completion)
        
        //3
        push(api: api, type: Unsplash.self) { result in
            switch result {
            case .success(let model): completion(model, nil)
            case .faulure(let error): completion(nil, error)
            }
        }
    }
}
