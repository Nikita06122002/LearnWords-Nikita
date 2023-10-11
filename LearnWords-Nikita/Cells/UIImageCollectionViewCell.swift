//
//  UIImageCollectionViewCell.swift
//  LearnWords-Nikita
//
//  Created by macbook on 11.10.2023.
//

import UIKit

final class UIImageCollectionViewCell: UICollectionViewCell {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        clearBackgroudColor()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

