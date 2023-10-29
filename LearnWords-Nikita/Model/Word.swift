//
//  Word.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import Foundation
import RealmSwift

class Word: Object {
    @Persisted(primaryKey: true) var _id: String = UUID().uuidString
    @Persisted var title = ""
    @Persisted var translate = ""
    
//    override static func primaryKey() -> String? {
//        return "title"
//    }
//    
//    override static func indexedProperties() -> [String] {
//        return ["title", "translate"]
//    }
}
