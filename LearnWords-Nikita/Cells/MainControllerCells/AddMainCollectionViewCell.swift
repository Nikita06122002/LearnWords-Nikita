//
//  AddMainCollectionViewCell.swift
//  LearnWords-Nikita
//
//  Created by macbook on 06.11.2023.
//

import UIKit

class AddMainCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clearBackgroudColor()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let button = UIButton(setImage: UIImage(named: "plus"))
    private let label = UILabel(text: "Новое слово", font: .systemFont(ofSize: 14))
    
    private func setupView() {
        
        
        button.clipsToBounds = true
        
        contentView.addSubViews(button, label)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            button.heightAnchor.constraint(equalToConstant: 59),
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
            
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 16),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 12),
            label.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -13)
        ])
    }
    
    
    func addTarget(_ target: Any, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

