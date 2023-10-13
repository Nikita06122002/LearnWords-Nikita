//
//  UIPhotosViewController.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 10.10.2023.
//

import UIKit

protocol UIPhotosViewControllerProtocol: AnyObject {
    func didSelectImage(_ image: UIImage)
}

final class UIPhotosViewController: ViewController {
    weak var delegate: UIPhotosViewControllerProtocol?
    
    private lazy var collectionView: UICollectionView = {
        let spacing = 5.0
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupView()
    }
    
    
    //MARK: - Setup
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
        return cell
    }
}


final class UIImageCollectionViewCell: UICollectionViewCell {
    class var identifier: String { "UIImageCollectionViewCell" }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
