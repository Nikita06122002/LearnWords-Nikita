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

final class NewWordViewContoller: ViewController, AVKitProtocol {
    var synthesizer: AVSpeechSynthesizer!
    
    
    var currentWord: Word?
    var currentIndex: Int?
    
    weak var delegate: NewWordDelegate?
    
    //WhiteView
    private let whiteView = UIView(color: .custom.white, radius: 20)
    
    //Выбор изображения
    private let chooseImageView = UIChooseImageView.init()
    
    //stack
    private lazy var stackView = UIStackView(.vertical, 27, .fill, .equalSpacing, [titleContentView, translateContentView, playButtonView, languageContentView])
    
    //picker
    private lazy var pickerView: UIImagePickerController = {
        let pickerView = UIImagePickerController()
        pickerView.delegate = self
        return pickerView
    }()
    
    
    
    private let titleContentView = UIEditWordTextField(title: "Слово", description: "на вашем языке")
    
    private let translateContentView = UIEditWordTextField(title: "Перевод", description: "на языке заучивания")
    
    private let playButtonView = LanguageAndVoice.init(title: "Воспроизвести", buttonImage: "voice", action: #selector(playButtonAction))
    
    private let languageContentView = LanguageAndVoice.init(buttonTitle: "Английский", languageLabel: "Язык перевода", buttonImage: "transit")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let word = currentWord {
            titleContentView.text = word.title
            translateContentView.text = word.translate
            
        }

        
        view.addSubViews(whiteView, chooseImageView)
        whiteView.addSubViews(stackView)
        
        setupConstraints()
        setupView()
        
        playButtonView.addTarget(self, action: #selector(playButtonAction))

    }
    
    @objc private func playButtonAction(_ sender: UIButton) {
        playSound(titleContentView.text)
    }

    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            chooseImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            chooseImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            chooseImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            chooseImageView.heightAnchor.constraint(equalTo: chooseImageView.widthAnchor, multiplier: 240 / 320),
            
            //whiteView
            whiteView.topAnchor.constraint(equalTo: chooseImageView.bottomAnchor, constant: 15),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            //stackView
            stackView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 6),
            stackView.leadingAnchor.constraint (equalTo: whiteView.leadingAnchor, constant: 21),
            stackView.trailingAnchor.constraint (equalTo: whiteView.trailingAnchor, constant: -21),
            stackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -34),
            
            
        ])
        
    }
    
    private func setupView() {
        //navigation
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        title = "Новое слово"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .done, target: self, action: #selector(backButtonPressed))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButtonPressed))
        
        navigationController?.navigationBar.tintColor = .custom.orange
        
        chooseImageView.addTarget(self, action: #selector(didTapChooseImage))
        
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonPressed() {
        let title = titleContentView.text ?? ""
        let translate = translateContentView.text ?? ""
        
        if !title.isEmpty && !translate.isEmpty {
            let word = Word()
            word.title = title
            word.translate = translate
            if let index = currentIndex {
                delegate?.didUpdateWord(word: word, at: index)
            } else {
                delegate?.didSaveNewWord(word: word)
            }
            navigationController?.popViewController(animated: true)
        } else {
            alert(title: "Внимание!", message: "Заполниите оба поля!", actionTitle: "ОК")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

@objc private extension NewWordViewContoller {
    
    func didTapChooseImage() {
        let alert = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
            self.pickerView.sourceType = .camera
            self.pickerView.allowsEditing = true
            self.navigationController?.present(self.pickerView, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Фотоальбом", style: .default, handler: { _ in
            self.pickerView.sourceType = .photoLibrary
            self.pickerView.allowsEditing = true
            self.navigationController?.present(self.pickerView, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Интернет", style: .default, handler: { _ in
            let vc = UIPhotosViewController()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { _ in
            self.chooseImageView.image = nil
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        if let popover = alert.popoverPresentationController {
            popover.sourceView = self.view
            let frame = view.bounds
            popover.sourceRect = .init(x: frame.midX - 30, y: frame.midY, width: 1, height: 1)
        }
        self.present(alert, animated: true, completion: nil)
    }
}


extension NewWordViewContoller: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        guard let image = info[.originalImage] as? UIImage else {
            print("Ошибка в пикере")
            return
        }
        
        self.chooseImageView.image = image

        picker.dismiss(animated: true)
    }
}


extension NewWordViewContoller: UIPhotosViewControllerProtocol {
    func didSelectImage(_ image: UIImage) {
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
