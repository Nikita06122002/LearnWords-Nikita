//
//  RealManager.swift
//  LearnWords-Nikita
//
//  Created by macbook on 27.10.2023.
//

import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    let realm: Realm
    
    private init() {
        realm = try! Realm()
    }
}
