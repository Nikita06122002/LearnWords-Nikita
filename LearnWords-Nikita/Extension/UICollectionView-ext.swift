//
//  UICollectionView-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 11.10.2023.
//

import UIKit

extension UICollectionView {
    
    convenience init(backgroundColor: UIColor? = .clear, frame: CGRect, layout: UICollectionViewLayout) {
        self.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = backgroundColor
    }
}
