//
//  MainTableViewCell.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainCell"
    
    var titleLabel = UILabel()
    var translateLabel = UILabel()
    var playButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupView() {
        
        playButton.setImage(UIImage(named: "voice"), for: .normal)
        titleLabel.font = .boldSystemFont(ofSize: 16)
        translateLabel.font = .systemFont(ofSize: 13)
        
        contentView.addSubViews(titleLabel, translateLabel, playButton)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: playButton.trailingAnchor, constant: -10),

            
            translateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            translateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            translateLabel.trailingAnchor.constraint(greaterThanOrEqualTo: playButton.trailingAnchor, constant: -10),
            translateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            
            playButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            playButton.widthAnchor.constraint(equalToConstant: 25),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor, multiplier: 1)

        ])
    }
}
