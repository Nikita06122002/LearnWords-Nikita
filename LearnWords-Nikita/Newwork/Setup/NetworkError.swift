//
//  NetworkError.swift
//  LearnWords-Nikita
//
//  Created by macbook on 30.10.2023.
//

import Foundation

enum NetworkError: Error {
    case notFoundUrl
    case error(_ error: Error?)
    
    var description: String {
        switch self {
        case .notFoundUrl: return "Ошибка, URL не работает"
        case .error(let error): return error?.localizedDescription ?? "Что то пошло не так"
        }
    }
}
