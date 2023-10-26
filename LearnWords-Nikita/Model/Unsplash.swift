//
//  Unsplash.swift
//  LearnWords-Nikita
//
//  Created by macbook on 25.10.2023.
//

import Foundation

struct Unsplash: Decodable {
    let total: Int?
    let total_pages: Int?
    let results: [ResultUnsplash]
    
}

struct ResultUnsplash: Decodable {
    let urls: URLUnsplash?
}

struct URLUnsplash: Decodable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
    let smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw
        case full
        case regular
        case small
        case thumb
        case smallS3 = "small_s3"
    }
}
