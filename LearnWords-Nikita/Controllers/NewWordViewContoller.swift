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

final class NewWordViewContoller: ViewController {
    
    var currentWord: Word?
    var currentIndex: Int?
    
    weak var delegate: NewWordDelegate?
    
    
    //WhiteView
    private let whiteView = UIView(color: .white, radius: 20)
    
    //Выбор изображения
    private let chooseImageView = UIView(color: .white, radius: 20)
    
    //stack
    private lazy var stackView = UIStackView(.vertical, 27, .fill, .equalSpacing, [titleContentView, translateContentView, playButtonView, languageContentView])
    
    
    
    private let titleContentView = UIEditWordTextField(title: "Слово", description: "на вашем языке")
    
    private let translateContentView = UIEditWordTextField(title: "Перевод", description: "на языке заучивания")
    
    private let playButtonView = LanguageAndVoice(title: "Воспроизвести", buttonImage: "voice")
    
    private let languageContentView = LanguageAndVoice.init(buttonTitle: "Английский", languageLabel: "Язык перевода", buttonImage: "transit")
    
    private let chooseImageContentView = LanguageAndVoice.init(imageName: "redimage", buttonTitle: "Выберите изображение")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let word = currentWord {
            titleContentView.text = word.title
            translateContentView.text = word.translate
        }
        //делегат
        chooseImageContentView.languageAndVoiceDelegate = self
        
        view.addSubViews(whiteView, chooseImageView)
        whiteView.addSubViews(stackView)
        chooseImageView.addSubViews(chooseImageContentView)
        
        setupConstraints()
        setupNavigationBar()
        setupView()
        
        playButtonView.addTarget(self, action: #selector(playButtonAction))
    }
    
    @objc private func playButtonAction(_ sender: UIButton) {
        guard let string = titleContentView.text, !string.isEmpty else { return }
        
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        utterance.volume = 1.0
        
        synthesizer.speak(utterance)
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
            
            chooseImageContentView.topAnchor.constraint(equalTo: chooseImageView.topAnchor, constant: 6),
            chooseImageContentView.leadingAnchor.constraint (equalTo: chooseImageView.leadingAnchor, constant: 21),
            chooseImageContentView.trailingAnchor.constraint (equalTo: chooseImageView.trailingAnchor, constant: -21),
            chooseImageContentView.bottomAnchor.constraint(equalTo: chooseImageView.bottomAnchor, constant: -34),
        ])
        
    }
    
    private func setupView() {
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

extension NewWordViewContoller: LanguageAndVoiceDelegate {
    
    func didTapChooseImage() {
        let alert = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Фотоальбом", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Интернет", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        
        if let popover = alert.popoverPresentationController {
            popover.sourceView = self.view
            let frame = view.bounds
            popover.sourceRect = .init(x: frame.midX - 30, y: frame.midY, width: 1, height: 1)
        }
        
        
        self.present(alert, animated: true, completion: nil)
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
