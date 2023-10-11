//
//  UICollectionViewCell-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 11.10.2023.
//

import UIKit

extension UICollectionViewCell {
    class var identifier: String { return String(describing: Self.self) }
    
    func clearBackgroudColor() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
}
