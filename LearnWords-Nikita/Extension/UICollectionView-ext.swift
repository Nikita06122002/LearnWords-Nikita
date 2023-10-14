//
//  UICollectionView-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 11.10.2023.
//

import UIKit

extension UICollectionView {
    
    convenience init(backgroundColor: UIColor? = .clear, frame: CGRect, spacing: CGFloat) {
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        self.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = backgroundColor
    }
}
