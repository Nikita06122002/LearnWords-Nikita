//
//  Api.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 29.10.2023.
//

import Foundation

enum HTTPMethods: String {
    case get
    case post
    case delete
    case put
    
    var string: String {
        self.rawValue.uppercased()
    }
    
}

enum Api {
    
    private var unsplash: String { return "https://api.unsplash.com/search/photos" }
    case downloadImage( string: String)
    
    
    //path
    var path: String {
        switch self {
        case .downloadImage(let string): return unsplash + "?page=1&per_page=30&query=" + string
        }
    }
    
    //header
    var header: [String: String] {
        switch self {
        case .downloadImage: return ["Accept-Version": "v1",
                                     "Authorization": "Client-ID \(SecretKeys.unsplash.rawValue)"]
        }
    }
    
    //method
    var method: String {
        switch self {
        case .downloadImage: return HTTPMethods.get.string
        }
    }
    
    
}
