//
//  NetworkProtocol.swift
//  LearnWords-Nikita
//
//  Created by macbook on 30.10.2023.
//

import Foundation

protocol NetworkProtocol {
    func getPhotos(text: String, completion: @escaping (Unsplash?, NetworkError?) -> Void)
}
