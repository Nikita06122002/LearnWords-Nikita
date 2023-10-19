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
    
    private var arrayURLs = [" ", " ", " "]
    
    weak var delegate: UIPhotosViewControllerProtocol?
    
    private let spacing = 5.0
    
    private lazy var collectionView = UICollectionView(backgroundColor: .clear, frame: view.bounds, spacing: 5)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        downloadPhotos()
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

extension UIPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIImageCollectionViewCell.identifier, for: indexPath) as? UIImageCollectionViewCell else { return UIImageCollectionViewCell() }
        
        let text = arrayURLs[indexPath.item]
        cell.setupView(text)
        cell.backgroundColor = .custom.orange
        
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

extension UIPhotosViewController {
    
    private func downloadPhotos() {
        Network.shared.getPhotos(text: "test", completion: { array in
            self.arrayURLs = array
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

