//
//  NewWordViewContoller.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit
import AVKit

protocol NewWordDelegate: AnyObject {
    func didSaveNewWord(word: Word)
    func didUpdateWord(word: Word, at index: Int)
    
}

final class NewWordViewContoller: UIViewController, AVSpeechSynthesizerDelegate {
    
    var currentWord: Word?
    var currentIndex: Int?
    
    weak var delegate: NewWordDelegate?
    
    
    private lazy var synthesizer: AVSpeechSynthesizer = {
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.delegate = self
        return synthesizer
    }()
    
    //WhiteView
    private let whiteView = UIView(color: .white, radius: 20)
    
    //Выбор изображения
    private let chooseImageView = UIView(color: .white, radius: 20)
    
    //stackView chooseImageView
    private lazy var chooseStackView = UIStackView(.vertical, 27, .fill, .equalSpacing, [chooseImageContentView])
    
    //stack
    private lazy var stackView = UIStackView(.vertical, 27, .fill, .equalSpacing, [titleContentView, translateContentView, playButtonView, languageContentView])
    
    
    
    let titleContentView = UIEditWordTextField(title: "Слово", description: "на вашем языке")
    
    let translateContentView = UIEditWordTextField(title: "Перевод", description: "на языке заучивания")
    
    let playButtonView = UIEditWordTextField.init(title: "Воспроизвести", buttonImage: "voice", action: #selector(playButtonAction))
    
    let languageContentView = UIEditWordTextField.init(buttonTitle: "Английский", languageLabel: "Язык перевода", buttonImage: "transit")
    
    let chooseImageContentView = UIEditWordTextField.init(imageName: "redimage", buttonTitle: "Выберите изображение", action: #selector(chooseImageAction))

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let word = currentWord {
            titleContentView.text = word.title
            translateContentView.text = word.translate
        }
        
        
        
        view.addSubViews(whiteView, chooseImageView)
        whiteView.addSubViews(stackView)
        chooseImageView.addSubViews(chooseStackView)
        
        setupConstraints()
        setupNavigationBar()
        setupView()

    }
    
    @objc private func playButtonAction() {
        guard let string = titleContentView.text, !string.isEmpty else { return }
        
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        utterance.volume = 1.0
        
        synthesizer.speak(utterance)
    }
    
    @objc private func chooseImageAction() {
        
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            chooseImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            chooseImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            chooseImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            //whiteView
            whiteView.topAnchor.constraint(equalTo: chooseImageView.bottomAnchor, constant: 15),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            //stackView
            stackView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 6),
            stackView.leadingAnchor.constraint (equalTo: whiteView.leadingAnchor, constant: 21),
            stackView.trailingAnchor.constraint (equalTo: whiteView.trailingAnchor, constant: -21),
            stackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -34),
            
            chooseStackView.topAnchor.constraint(equalTo: chooseImageView.topAnchor, constant: 6),
            chooseStackView.leadingAnchor.constraint (equalTo: chooseImageView.leadingAnchor, constant: 21),
            chooseStackView.trailingAnchor.constraint (equalTo: chooseImageView.trailingAnchor, constant: -21),
            chooseStackView.bottomAnchor.constraint(equalTo: chooseImageView.bottomAnchor, constant: -34),
            
            
        ])
        
    }
    
    private func setupView() {
        
        //View
        view.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1)
        
        
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
        let title = titleContentView.text ?? ""
        let translate = translateContentView.text ?? ""
        
        let word = Word(title: title, translate: translate)
        if let index = currentIndex {
            delegate?.didUpdateWord(word: word, at: index)
        } else {
            delegate?.didSaveNewWord(word: word)
        }
        navigationController?.popViewController(animated: true)
        
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
