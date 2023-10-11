//
//  UIPhotosViewController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 10.10.2023.
//

import UIKit

protocol UIPhotosViewControllerProtocol: AnyObject {
    func didSelectImage(_ image: UIImage)
}

class UIPhotosViewController: ViewController {
    
    weak var delegate: UIPhotosViewControllerProtocol?
    
    private lazy var collectionView: UICollectionView = {
        
        let spacing = 5.0
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        let collectView = UICollectionView(backgroundColor: .clear, frame: view.bounds, layout: layout)
        return collectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        initialize()
    }
    
    func initialize() {
        view.addSubview(collectionView)
        collectionView.fillConstraint()
    }
    
    func setupView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UIImageCollectionViewCell.self, forCellWithReuseIdentifier: UIImageCollectionViewCell.identifier)
    }
    
}

extension UIPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIImageCollectionViewCell.identifier, for: indexPath)
        
        cell.backgroundColor = .custom.orange
        
        return cell
    }
    
    
}

