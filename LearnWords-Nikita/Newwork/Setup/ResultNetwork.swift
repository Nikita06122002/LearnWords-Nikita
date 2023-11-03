//
//  ResultNetwork.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 03.11.2023.
//

import Foundation

enum Result<T> {
    case success(model: T)
    case faulure(error: NetworkError)
}
