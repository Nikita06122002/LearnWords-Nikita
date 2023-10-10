//
//  UIChooseImageView.swift
//  LearnWords-Nikita
//
//  Created by macbook on 10.10.2023.
//

import UIKit

class UIChooseImageView: UIView {
    
    private let chooseImageContentView = LanguageAndVoice.init(imageName: "redimage", buttonTitle: "Выберите изображение")
    
    private let imageView: UIImageView = .init()
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .custom.white
        layer.cornerRadius = 20
        clipsToBounds = true
        
        self.addSubViews(chooseImageContentView, imageView)
        chooseImageContentView.fillConstraint(top: 6, bottom: -34, leading: 21, trailing: -21)
        imageView.fillConstraint()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTarget(_ target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
        
    }
}
