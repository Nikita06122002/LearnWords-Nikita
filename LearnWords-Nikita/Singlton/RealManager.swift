//
//  RealManager.swift
//  LearnWords-Nikita
//
//  Created by macbook on 27.10.2023.
//

import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    let realm: Realm!
    
    private init() {
        do {
            realm = try Realm()
        } catch {
            realm = nil
            print(error.localizedDescription)
        }
    }
    
    //get
    var words: [Word] {
        let set = realm.objects(Word.self)
        return Array(set)
    }
    
    //delete
    func delete(word: Object) {
        do {
            try realm.write {
                realm.delete(word)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //edit
    func edit(word: Object) {
        do {
            try realm.write {
                realm.add(word, update: .modified)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //add
    func save(word: Object) {
        do {
            try realm.write {
                realm.add(word)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
