//
//  UIMainCollectionController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 06.11.2023.
//

import UIKit

class UIMainCollectionController: ViewController {
    
    private var words = RealmManager.shared.words
    
    private let spacing = 5.0
    
    private lazy var collectionView = UICollectionView(backgroundColor: .clear, frame: view.bounds, spacing: 5)
    private var rightBarButtonItem = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupView()
        
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
                print(RealmManager.shared.realm.configuration.fileURL)
    }
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}


extension UIMainCollectionController {
    
    private func setupView() {
        title = "Все слова"
        
        view.backgroundColor = .custom.white
        
        rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        rightBarButtonItem.tintColor = .custom.orange
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .custom.white
    }
    
    
    @objc func barItemAction() {
        
        let vc = NewWordViewContoller()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    

  
}

extension UIMainCollectionController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return words.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        
//        if indexPath.row < words.count {
//            
//            let word = words[indexPath.row]
//            cell.setupView(word: word)
//        }
//        
//        
//        return cell
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else { return MainCollectionViewCell() }
        
        let word = words[indexPath.item]
        cell.setupView(word: word)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let count = 3.0
        let widhtCollectionView = collectionView.bounds.width
        let fillSpacing = spacing * (count + 1)
        let widht = (widhtCollectionView - fillSpacing) / count
        
        return .init(width: widht, height: 100)
    }
    
}

extension UIMainCollectionController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < words.count {
            let selectedRow = words[indexPath.row]
            let vc = NewWordViewContoller()
            vc.delegate = self
            vc.currentWord = selectedRow
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}


extension UIMainCollectionController: NewWordDelegate {
    func didUpdateWord(word: Word) {
        RealmManager.shared.edit(word: word)
        words = RealmManager.shared.words
        collectionView.reloadData()
    }
    
    func didSaveNewWord(word: Word) {
        RealmManager.shared.save(word: word)
        words = RealmManager.shared.words
        collectionView.reloadData()
    }
}


