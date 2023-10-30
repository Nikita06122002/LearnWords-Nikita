//
//  SearchViewDelegeta.swift
//  LearnWords-Nikita
//
//  Created by macbook on 30.10.2023.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    func didPressSearchButton(text: String?)
}
