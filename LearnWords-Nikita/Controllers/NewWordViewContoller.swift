//
//  NewWordViewContoller.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit

final class NewWordViewContoller: UIViewController {
    
    //WhiteView
    private let whiteView = UIView(color: .white, radius: 20)
    
    //stack
    private let stackView = UIStackView()
    
    //Title
    private let titleTextField = UITextField(color: UIColor(red: 0.946, green: 0.946, blue: 0.962, alpha: 1))
    
    //Translate
    private let translateTextField = UITextField()
    
    
    //Play
    private let playButtonView = UIView()
    private let playLabel = UILabel()
    private let playButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleContentView = setupContentView(title: "Слово", description: "на вашем языке", textField: titleTextField)
        let translateContentView = setupContentView(title: "Перевод", description: "на языке заучивания", textField: translateTextField)
        
        view.addSubview(whiteView)
        stackView.addArrangedSubviews(titleContentView, translateContentView, playButtonView)
        whiteView.addSubViews(stackView)
        playButtonView.addSubViews(playLabel, playButton)
        
        
        setupConstraints()
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            //whiteView
            whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            //stackView
            stackView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 6),
            stackView.leadingAnchor.constraint (equalTo: whiteView.leadingAnchor, constant: 21),
            stackView.trailingAnchor.constraint (equalTo: whiteView.trailingAnchor, constant: -21),
            stackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -34),
            
            
            
            //MARK: - Play Content View
            
            //PlayLabel
            playLabel.topAnchor.constraint(equalTo: playButtonView.topAnchor, constant: 8),
            playLabel.leadingAnchor.constraint (equalTo: playButtonView.leadingAnchor),
            playLabel.centerYAnchor.constraint(equalTo: playButtonView.centerYAnchor),
            playLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //PlayButton
            playButton.topAnchor.constraint(greaterThanOrEqualTo: playButtonView.topAnchor, constant: 8),
            playButton.leadingAnchor.constraint(lessThanOrEqualTo: playLabel.trailingAnchor, constant: 28),
            playButton.trailingAnchor.constraint(equalTo: playButtonView.trailingAnchor, constant: -7),
            playButton.widthAnchor.constraint(equalToConstant: 35),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor, multiplier: 1)
            
        ])
        
    }
    
    private func setupView() {
        
        //View
        view.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1)
        
        //WhiteView
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        //StackView
        stackView.axis = .vertical//вертикальное положение элементов
        stackView.spacing = 27//расстояние между элементами
        stackView.alignment = .fill//по всей ширине
        stackView.distribution = .equalSpacing //расположение высоты
        
        
        //play
        playButtonView.backgroundColor = .clear
        playLabel.font = UIFont.boldSystemFont(ofSize: 16)
        playLabel.text = "Воспроизвести"
        playButton.setImage(UIImage(named: "voice"), for: .normal)
        
        //navigation
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        title = "Новое слово"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .done, target: self, action: #selector(backButtonPressed))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButtonPressed))
        
        navigationController?.navigationBar.tintColor = .orange
        
        
        
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonPressed() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension NewWordViewContoller {
    private func setupContentView(title: String, description: String, textField: UITextField) -> UIView {
        
        let contentView = UIView(color: .clear)
        
        let label = UILabel(text: title, font: .boldSystemFont(ofSize: 16), textColor: .black)
        
        let descriptionLabel = UILabel(text: description, font: .boldSystemFont(ofSize: 10), textColor: .systemGray4)
       
        
        let lineView = UIView(color: .systemGray5)
        
        textField.placeholder = "Текст"
        textField.backgroundColor = .white
        
        contentView.addSubViews(label, descriptionLabel, textField, lineView)
        
        NSLayoutConstraint.activate([
            //titleLabel
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            label.leadingAnchor.constraint (equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            //titileDescriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 1),
            descriptionLabel.leadingAnchor.constraint (equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 12),
            
            //TitileTextField
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 17),
            textField.leadingAnchor.constraint (equalTo: contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            //TitleLineView
            lineView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 1),
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        return contentView
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
