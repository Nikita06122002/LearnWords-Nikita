//
//  MainCollectionViewCell.swift
//  LearnWords-Nikita
//
//  Created by macbook on 06.11.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    private let image = UIImageView()
    private let titleLabel = UILabel(font: .boldSystemFont(ofSize: 16))
    private let translateLabel = UILabel(font: .systemFont(ofSize: 13))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clearBackgroudColor()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupView() {
        
        let smallestSide = min(image.frame.size.width, image.frame.size.height)
        image.layer.cornerRadius = smallestSide/2
        image.clipsToBounds = true
        let stackView = UIStackView(.vertical, 1, .center, .fill, [image, titleLabel ,translateLabel])
        
        contentView.addSubViews(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint (equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            image.widthAnchor.constraint(equalToConstant: 59),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            translateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16),

        ])
    }
    
    func setupView(word: Word) {
        titleLabel.text = word.title
        translateLabel.text = word.translate
        
    }

}
