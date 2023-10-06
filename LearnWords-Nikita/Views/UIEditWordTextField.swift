//
//  EditWordTextField.swift
//  LearnWords-Nikita
//
//  Created by macbook on 05.10.2023.
//

import UIKit

final class UIEditWordTextField: UIView {
    
    private let textField: UITextField = UITextField(color: UIColor(red: 0.946, green: 0.946, blue: 0.962, alpha: 1))
    
    var text: String? {
        get {
            return textField.text
        }
        
        set {
            textField.text = newValue
        }
    }
    
    
    //Выбор изображения
    
    init(imageName: String, buttonTitle: String, action: Selector) {
        super.init(frame: .infinite)
        setupChooseImageContentView(imageName: imageName, buttonTitle: buttonTitle, action: action)
    }
    
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
    //контентвью с текстфилдами
    init(title: String, description: String) {
        super.init(frame: .infinite)
        setupContentView(title: title, description: description)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - контентвью с текстфилдами
    private func setupContentView(title: String, description: String) {
        
        
        let label = UILabel(text: title, font: .boldSystemFont(ofSize: 16), textColor: .black)
        
        let descriptionLabel = UILabel(text: description, font: .boldSystemFont(ofSize: 10), textColor: .systemGray4)
        
        let lineView = UIView(color: .systemGray5)
        
        
        
        textField.placeholder = "Текст"
        textField.backgroundColor = .white
        
        self.addSubViews(label, descriptionLabel, textField, lineView)
        
        NSLayoutConstraint.activate([
            //titleLabel
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            label.leadingAnchor.constraint (equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            //titileDescriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 1),
            descriptionLabel.leadingAnchor.constraint (equalTo: self.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 12),
            
            //TitileTextField
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 17),
            textField.leadingAnchor.constraint (equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            //TitleLineView
            lineView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 1),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
        
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
        let label = UILabel(text: title, font: .boldSystemFont(ofSize: 16), textColor: .black)
        let button = UIButton(setImage: UIImage(named: buttonImage))
        let lineView = UIView(color: .systemGray4)
        self.backgroundColor = .clear
        
        button.addTarget(self, action: action, for: .touchUpInside)
        
        self.addSubViews(label, button, lineView)
        
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
    
    
    //MARK: - Выбор изображения
    private func setupChooseImageContentView(imageName: String, buttonTitle: String, action: Selector) {
        let redImageView = UIImageView(image: UIImage(named: imageName))
        let button = UIButton(title: buttonTitle, titleColor: .systemGray4, font: 15)
        button.addTarget(self, action: action, for: .touchUpInside)
        self.backgroundColor = .clear
        
        self.addSubViews(redImageView, button)
        
        NSLayoutConstraint.activate([
            
            redImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            redImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: redImageView.bottomAnchor),
            button.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -35),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        ])
        
    }
    
}
