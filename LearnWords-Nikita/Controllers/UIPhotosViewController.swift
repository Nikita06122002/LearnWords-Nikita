//
//  UIPhotosViewController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 10.10.2023.
//

import UIKit
import SDWebImage

protocol UIPhotosViewControllerProtocol: AnyObject {
    func didSelectImage(_ image: UIImage)
}

class UIPhotosViewController: ViewController {
    
    private var imagesUnsplash: Unsplash?
    
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
        let count = imagesUnsplash?.results.count ?? 0
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIImageCollectionViewCell.identifier, for: indexPath) as? UIImageCollectionViewCell else { return UIImageCollectionViewCell() }
        
        let value = imagesUnsplash?.results[indexPath.row].urls
        
        if let string = value?.regular, let url = URL(string: string) {
            cell.imageView.sd_setImage(with: url)
        } 
        
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
        Network.shared.getPhotos(text: "test", completion: { value, error in
            guard let value = value else {
                let text = error?.localizedDescription ?? "Что то пошло не так, повторите запрос заново"
                DispatchQueue.main.async {
                    self.alert(title: "Ошибка", message: text, actionTitle: nil)
                }
                return
            }
            
            self.imagesUnsplash = value
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

