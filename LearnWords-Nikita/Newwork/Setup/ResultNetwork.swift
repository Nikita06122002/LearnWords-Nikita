//
//  ResultNetwork.swift
//  LearnWords-Nikita
//
//  Created by macbook on 05.11.2023.
//

import Foundation
enum Result<T> {
    case succes(model: T)
    case failure(error: NetworkError)
}
