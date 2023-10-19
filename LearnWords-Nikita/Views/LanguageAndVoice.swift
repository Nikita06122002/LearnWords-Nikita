//
//  LanguageAndVoice.swift
//  LearnWords-Nikita
//
//  Created by macbook on 08.10.2023.
//

import UIKit

final class LanguageAndVoice: UIView {
    
    private lazy var button: UIButton = .init()
    
    //Контент вью для выбора языка
    init(buttonTitle: String, languageLabel: String, buttonImage: String) {
        super.init(frame: .infinite)
        setupLanguageContentView(buttonTitle: buttonTitle, languageLabel: languageLabel, buttonImage: buttonImage)
    }
    
    //воспроизведение голосом
    init(title: String, buttonImage: String, action: Selector) {
        super.init(frame: .infinite)
        setupPlayContentView(title: title, buttonImage: buttonImage, action: action)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Контент вью для выбора языка

    private func setupLanguageContentView(buttonTitle: String, languageLabel: String, buttonImage: String) {
        
        let englishLabel = UILabel(text: "Английский", font: .systemFont(ofSize: 13), textColor: .orange)
        let transitButton = UIButton(setImage: UIImage(named: buttonImage))
        let languageLabel = UILabel(text: languageLabel, font: .boldSystemFont(ofSize: 16))
        self.backgroundColor = .clear
        
        self.addSubViews(englishLabel, transitButton, languageLabel)
        
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            languageLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor),
            languageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            languageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            englishLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 10),
            englishLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            englishLabel.trailingAnchor.constraint(equalTo: transitButton.leadingAnchor, constant: -7),

            
            transitButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            transitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3)
        ])
    }
    //MARK: - Контентвью для воспроизведения слов голосом
    private func setupPlayContentView(title: String, buttonImage: String, action: Selector) {
        let label = UILabel(text: title, font: .boldSystemFont(ofSize: 16), textColor: .custom.black)
        button.setImage(UIImage(named: buttonImage), for: .normal)
        let lineView = UIView(color: .custom.gray)
        self.backgroundColor = .clear
        self.addSubViews(label, button, lineView)
        
        button.addTarget(nil, action: action, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            //PlayLabel
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            label.leadingAnchor.constraint (equalTo: self.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            //PlayButton
            button.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor),
            button.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: 28),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -7),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 35),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
            
            
            lineView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)


        ])
        
    }
    
    func addTarget(_ target: Any, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}
