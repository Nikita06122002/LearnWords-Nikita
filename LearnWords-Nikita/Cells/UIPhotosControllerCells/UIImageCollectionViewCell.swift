//
//  UIImageCollectionViewCell.swift
//  LearnWords-Nikita
//
//  Created by macbook on 11.10.2023.
//

import UIKit

final class UIImageCollectionViewCell: UICollectionViewCell {
    
    //Старых картинок не останется, если не успеют подгрузиться новые
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    let imageView: UIImageView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clearBackgroudColor()
        contentView.addSubViews(imageView)
        imageView.fillConstraint()
        
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

