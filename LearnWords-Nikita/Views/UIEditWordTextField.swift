//
//  EditWordTextField.swift
//  LearnWords-Nikita
//
//  Created by macbook on 05.10.2023.
//

import UIKit

final class UIEditWordTextField: UIView {
    
    
    private let textField: UITextField = UITextField(color: .custom.gray)
    
    var text: String? {
        get {
            return textField.text
        }
        
        set {
            textField.text = newValue
        }
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
        
        
        let label = UILabel(text: title, font: .boldSystemFont(ofSize: 16), textColor: .custom.black)
        
        let descriptionLabel = UILabel(text: description, font: .boldSystemFont(ofSize: 10), textColor: .custom.gray)
        
        let lineView = UIView(color: .custom.gray)
        
        
        
        textField.placeholder = "Текст"
        textField.backgroundColor = .custom.white
        
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
}
