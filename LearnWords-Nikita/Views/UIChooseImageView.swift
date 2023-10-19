//
//  UIChooseImageView.swift
//  LearnWords-Nikita
//
//  Created by macbook on 10.10.2023.
//

import UIKit

class UIChooseImageView: UIView {
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
        
        let  chooseImageContentView = setupChooseImageContentView(imageName: "redimage", buttonTitle: "Выберите изображение")
        
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
    
    //MARK: - Выбор изображения
    private func setupChooseImageContentView(imageName: String, buttonTitle: String) -> UIView {
        let view = UIView()
        let redImageView = UIImageView(image: UIImage(named: imageName))
        let label = UILabel(text: buttonTitle, font: .systemFont(ofSize: 15), textColor: .custom.gray)
        
        view.backgroundColor = .clear
        view.addSubViews(redImageView, label)
        
        NSLayoutConstraint.activate([
            redImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 22),
            redImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: redImageView.bottomAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -35),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
        
        return view
    }
}
