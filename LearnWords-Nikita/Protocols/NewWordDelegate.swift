//
//  NewWordDelegate.swift
//  LearnWords-Nikita
//
//  Created by macbook on 30.10.2023.
//

import Foundation

protocol NewWordDelegate: AnyObject {
    func didSaveNewWord(word: Word)
    func didUpdateWord(word: Word)
    
}
