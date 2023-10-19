//
//  UIImageCollectionViewCell.swift
//  LearnWords-Nikita
//
//  Created by macbook on 11.10.2023.
//

import UIKit

final class UIImageCollectionViewCell: UICollectionViewCell {
    private let label: UILabel = .init()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clearBackgroudColor()
        contentView.addSubview(label)
        label.fillConstraint()
        label.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(_ text: String) {
        label.text = text
    }
}

