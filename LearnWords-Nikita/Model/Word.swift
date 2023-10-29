//
//  Word.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import Foundation
import RealmSwift

class Word: Object {
    @objc dynamic var title = ""
    @objc dynamic var translate = ""
    
//    override static func primaryKey() -> String? {
//        return "title"
//    }
//    
//    override static func indexedProperties() -> [String] {
//        return ["title", "translate"]
//    }
}
