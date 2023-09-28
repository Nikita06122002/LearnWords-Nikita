//
//  NewWordViewController.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 27.09.2023.
//

import UIKit

final class NewWordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupConstraints() {
        view.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1)
        
        let whiteView = UIView()
        view.addSubview(whiteView)
        whiteView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        whiteView.layer.cornerRadius = 20
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let titleContentView = UIView()
        titleContentView.backgroundColor = .systemPink
        let titleLabel = UILabel()
        let titleDescriptionLabel = UILabel()
        let titleTextField = UITextField()
        let titleLineView = UIView()
        
        let translateContentView = UIView()
        translateContentView.backgroundColor = .systemGray2
        let translateLabel = UILabel()
        let translateDescriptionLabel = UILabel()
        let translateTextField = UITextField()
        let translateLineView = UIView()
        
        let playButtonView = UIView()
        playButtonView.backgroundColor = .orange
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 27
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubviews(titleContentView, translateContentView, playButtonView)
        whiteView.addSubviews(stackView)
        
        //title
        titleContentView.addSubviews(titleLabel, titleDescriptionLabel, titleTextField, titleLineView)
        
        
        //translate
        
        
        //play
        
        playButtonView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            whiteView.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
        
            stackView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -12),

            
        ])
    }
    
    private func setupView() {
    }
}



//MARK: - SwiftUI
import SwiftUI
struct NewWordViewController_Provider : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return NewWordViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = NewWordViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<NewWordViewController_Provider.ContainterView>) -> NewWordViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: NewWordViewController_Provider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<NewWordViewController_Provider.ContainterView>) {
            
        }
    }
    
}

