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
    
    private var arrayURLs = ["Никита", "Алмаз", "Bob"]
    weak var delegate: UIPhotosViewControllerProtocol?
    private let spacing = 5.0
    private lazy var collectionView: UICollectionView = .init(backgroundColor: .clear, frame: view.bounds, spacing: spacing)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Выбор фотографии"
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIImageCollectionViewCell.identifier, for: indexPath) as? UIImageCollectionViewCell
        else { return UIImageCollectionViewCell()}
        
        cell.backgroundColor = .custom.orange
        
        let text = arrayURLs[indexPath.item]
        cell.setupView(text)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count = 3.0
        let widthCollectionView = collectionView.bounds.width
        let fillSpacing = spacing * (count + 1)
        let width = (widthCollectionView - fillSpacing) / count
        return CGSize(width: width, height: 100)
    }
    
    
}



extension UIPhotosViewController {
    
    private func resultNetwork(array: [String]) {
        self.arrayURLs = array
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    private func downloadPhotos() {
        Network.shared.getPhotos(text: "test", completion: resultNetwork)
    }
}
