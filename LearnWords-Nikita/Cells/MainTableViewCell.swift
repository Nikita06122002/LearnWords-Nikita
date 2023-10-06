//
//  MainTableViewCell.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    
    private let titleLabel = UILabel(font: .boldSystemFont(ofSize: 16))
    private let translateLabel = UILabel(font: .systemFont(ofSize: 13))
    private let playButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clearBackgroudColor()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupView() {
        
        playButton.setImage(UIImage(named: "voice"), for: .normal)
        
        let stackView = UIStackView(.vertical, 1, .fill, .fill, [titleLabel, translateLabel])
        
        contentView.addSubViews(stackView, playButton)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: playButton.leadingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            translateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16),
            
            playButton.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            playButton.widthAnchor.constraint(equalToConstant: 25),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor)

        ])
    }
    
    func setupView(word: Word) {
        titleLabel.text = word.title
        translateLabel.text = word.translate
        
    }
    
}
