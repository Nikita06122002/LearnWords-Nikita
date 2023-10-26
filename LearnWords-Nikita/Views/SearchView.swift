//
//  SearchView.swift
//  LearnWords-Nikita
//
//  Created by macbook on 26.10.2023.
//

import Foundation
import UIKit

protocol SearchViewDelegate: AnyObject {
    func didPressSearchButton(text: String?)
}

final class SearchView: UIView {
    weak var delegate: SearchViewDelegate?
    
    init() {
        super.init(frame: .infinite)
        setupSearch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchButton = UIButton(title: "Поиск", font: 18, backgroundColor: UIColor.blue, cornerRadius: 5)
    
    private let searchTextField = UITextField(borderStyle: .roundedRect, font: .systemFont(ofSize: 15))
    
    private func setupSearch() {
        searchTextField.placeholder = "Введите слово на английском языке"
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        
        self.addSubViews(searchButton, searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(lessThanOrEqualTo: searchButton.leadingAnchor, constant: -10),
            
            searchButton.topAnchor.constraint(equalTo: searchTextField.topAnchor),
            searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            searchButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    @objc func searchButtonPressed() {
        delegate?.didPressSearchButton(text: searchTextField.text)
    }
}
