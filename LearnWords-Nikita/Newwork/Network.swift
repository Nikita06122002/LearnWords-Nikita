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

        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            completion(["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой"])

        }
    }
}