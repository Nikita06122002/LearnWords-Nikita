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
    
    //stack
    private let stackView = UIStackView()
    
    //Translate
    let titleContentView = UIEditWordTextField(title: "Слово", description: "на вашем языке")
    let translateContentView = UIEditWordTextField(title: "Перевод", description: "на языке заучивания")
    
    
    //Play
    private let playButtonView = UIView()
    private let playLabel = UILabel()
    private let playButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let word = currentWord {
            titleContentView.text = word.title
            translateContentView.text = word.translate
        }
        
        
        
        view.addSubview(whiteView)
        stackView.addArrangedSubviews(titleContentView, translateContentView, playButtonView)
        whiteView.addSubViews(stackView)
        playButtonView.addSubViews(playLabel, playButton)
        
        
        setupConstraints()
        setupNavigationBar()
        setupView()
        
        playButton.addTarget(self, action: #selector(playButtonAction(_:)), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        
    }
    
    @objc private func playButtonAction(_ sender: UIButton) {
        guard let string = titleContentView.text, !string.isEmpty else { return }
        
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        utterance.volume = 1.0
        
        synthesizer.speak(utterance)
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
