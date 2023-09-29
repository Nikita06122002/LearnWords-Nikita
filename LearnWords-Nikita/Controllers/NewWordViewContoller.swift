//
//  NewWordViewContoller.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit

final class NewWordViewContoller: UIViewController {
    
    //WhiteView
    var whiteView = UIView()
    
    //stack
    let stackView = UIStackView()
    
    //Title
    let titleContentView = UIView()
    let titleLabel = UILabel()
    let titleDescriptionLabel = UILabel()
    let titleTextField = UITextField()
    let titleLineView = UIView()
    
    //Translate
    let translateContentView = UIView()
    let translateLabel = UILabel()
    let translateDescriptionLabel = UILabel()
    let translateTextField = UITextField()
    let translateLineView = UIView()
    
    
    //Play
    let playButtonView = UIView()
    let playLabel = UILabel()
    let playButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(whiteView)
        stackView.addArrangedSubviews(titleContentView, translateContentView, playButtonView)
        whiteView.addSubViews(stackView)
        titleContentView.addSubViews(titleLabel, titleDescriptionLabel, titleTextField, titleLineView)
        translateContentView.addSubViews(translateLabel, translateDescriptionLabel, translateTextField, translateLineView)
        playButtonView.addSubViews(playLabel, playButton)
        
        
        setupConstraints()
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            whiteView.widthAnchor.constraint(lessThanOrEqualToConstant: 345),
            whiteView.heightAnchor.constraint(lessThanOrEqualToConstant: 297),
            
            
            
            stackView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 6),
            stackView.leadingAnchor.constraint (equalTo: whiteView.leadingAnchor, constant: 21),
            stackView.trailingAnchor.constraint (equalTo: whiteView.trailingAnchor, constant: -29),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: whiteView.bottomAnchor, constant: -6),
            
            //MARK: - Title constraints
            titleContentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -29),
            titleContentView.heightAnchor.constraint(equalToConstant: 82),
            //titleLabel
            titleLabel.topAnchor.constraint(equalTo: titleContentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint (equalTo: titleContentView.leadingAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 121),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            //titileDescriptionLabel
            titleDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            titleDescriptionLabel.leadingAnchor.constraint (equalTo: titleContentView.leadingAnchor),
            titleDescriptionLabel.widthAnchor.constraint(equalToConstant: 87),
            titleDescriptionLabel.heightAnchor.constraint(equalToConstant: 12),
            //TitileTextField
            titleTextField.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: 17),
            titleTextField.leadingAnchor.constraint (equalTo: titleContentView.leadingAnchor),
            titleTextField.widthAnchor.constraint(equalToConstant: 121),
            titleTextField.heightAnchor.constraint(equalToConstant: 15),
            //TitleLineView
            titleLineView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 5),
            titleLineView.leadingAnchor.constraint(equalTo: titleContentView.leadingAnchor),
            titleLineView.trailingAnchor.constraint(equalTo: titleContentView.trailingAnchor, constant: -7),
            titleLineView.heightAnchor.constraint(equalToConstant: 3),
            
            //MARK: - Translate constraints
            translateContentView.heightAnchor.constraint(equalToConstant: 82),
            //TranslateLabel
            translateLabel.topAnchor.constraint(equalTo: translateContentView.topAnchor, constant: 18),
            translateLabel.leadingAnchor.constraint (equalTo: translateContentView.leadingAnchor),
            translateLabel.widthAnchor.constraint(equalToConstant: 78),
            translateLabel.heightAnchor.constraint(equalToConstant: 20),
            //TranslateDescriptionLabel
            translateDescriptionLabel.topAnchor.constraint(equalTo: translateLabel.bottomAnchor, constant: 1),
            translateDescriptionLabel.leadingAnchor.constraint (equalTo: translateContentView.leadingAnchor),
            translateDescriptionLabel.widthAnchor.constraint(equalToConstant: 121),
            translateDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            //TranslateTextField
            translateTextField.topAnchor.constraint(equalTo: translateDescriptionLabel.bottomAnchor, constant: 17),
            translateTextField.leadingAnchor.constraint (equalTo: translateContentView.leadingAnchor),
            translateTextField.widthAnchor.constraint(equalToConstant: 121),
            translateTextField.heightAnchor.constraint(equalToConstant: 15),
            //TranslateLineView
            translateLineView.topAnchor.constraint(equalTo: translateTextField.bottomAnchor, constant: 5),
            translateLineView.leadingAnchor.constraint(equalTo: translateContentView.leadingAnchor),
            translateLineView.trailingAnchor.constraint(equalTo: translateContentView.trailingAnchor, constant: -7),
            translateLineView.heightAnchor.constraint(equalToConstant: 3),
            
            //MARK: - Play Content View
            playButtonView.heightAnchor.constraint(equalToConstant: 82),
            //PlayLabel
            playLabel.topAnchor.constraint(equalTo: playButtonView.topAnchor, constant: 8),
            playLabel.leadingAnchor.constraint (equalTo: playButtonView.leadingAnchor),
            playLabel.bottomAnchor.constraint(equalTo: playButtonView.bottomAnchor, constant: -7),
            playLabel.widthAnchor.constraint(equalToConstant: 225),
            playLabel.heightAnchor.constraint(equalToConstant: 20),
            //PlayButton
            playButton.topAnchor.constraint(equalTo: playButtonView.topAnchor, constant: 8),
            playButton.bottomAnchor.constraint(equalTo: playButtonView.bottomAnchor, constant: -7),
            playButton.leadingAnchor.constraint(equalTo: playLabel.trailingAnchor, constant: 28),
            playButton.trailingAnchor.constraint(equalTo: playButtonView.trailingAnchor, constant: -7),
            playButton.widthAnchor.constraint(equalToConstant: 35),
            playButton.heightAnchor.constraint(equalToConstant: 35),
            
        ])
        
    }
    
    private func setupView() {
        
        //View
        view.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1)
        view.layer.cornerRadius = 20
        
        //WhiteView
        whiteView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        //StackView
        stackView.axis = .vertical//вертикальное положение элементов
        stackView.spacing = 27//расстояние между элементами
        stackView.alignment = .fill//по всей ширине
        stackView.distribution = .equalSpacing //расположение высоты
        whiteView.layer.cornerRadius = 20
        
        //title
        titleLabel.text = "Слово"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleDescriptionLabel.text = "на вашем языке"
        titleDescriptionLabel.font = UIFont.systemFont(ofSize: 10)
        titleDescriptionLabel.textColor = UIColor(red: 0.688, green: 0.688, blue: 0.74, alpha: 1)
        titleTextField.placeholder = "Текст"
        titleTextField.backgroundColor = .white
        titleLineView.layer.borderWidth = 1
        titleLineView.layer.borderColor = UIColor(red: 0.946, green: 0.946, blue: 0.962, alpha: 1).cgColor
        
        //translate
        translateLabel.text = "Перевод"
        translateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        translateDescriptionLabel.text = "на языке заучивания"
        translateDescriptionLabel.font = UIFont.systemFont(ofSize: 10)
        translateDescriptionLabel.textColor = UIColor(red: 0.688, green: 0.688, blue: 0.74, alpha: 1)
        translateTextField.placeholder = "Текст"
        translateTextField.backgroundColor = .white
        translateLineView.layer.borderWidth = 1
        translateLineView.layer.borderColor = UIColor(red: 0.946, green: 0.946, blue: 0.962, alpha: 1).cgColor
        
        
        //play
        playButtonView.backgroundColor = .clear
        playLabel.font = UIFont.boldSystemFont(ofSize: 16)
        playLabel.text = "Воспроизвести"
        playButton.setImage(UIImage(named: "voice"), for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

//MARK: - SwiftUI
import SwiftUI
struct NewWordViewContoller_Provider : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return NewWordViewContoller()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = NewWordViewContoller()
        func makeUIViewController(context: UIViewControllerRepresentableContext<NewWordViewContoller_Provider.ContainterView>) -> NewWordViewContoller {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: NewWordViewContoller_Provider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<NewWordViewContoller_Provider.ContainterView>) {
            
        }
    }
    
}
