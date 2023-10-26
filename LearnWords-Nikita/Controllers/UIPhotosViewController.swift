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
    
    
    private let searchView = SearchView()
    
    private var imagesUnspalsh: Unsplash?
    
    weak var delegate: UIPhotosViewControllerProtocol?
    
    private let spacing = 5.0
    
    private lazy var collectionView = UICollectionView(backgroundColor: .clear, frame: view.bounds, spacing: 5)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupView()
        setupSearch()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        downloadPhotos()
    }
    
    func initialize() {
        view.addSubViews(collectionView, searchView)

    }
    
    func setupView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UIImageCollectionViewCell.self, forCellWithReuseIdentifier: UIImageCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([

            
            collectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupSearch() {
        searchView.delegate = self
        NSLayoutConstraint.activate([
                searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                searchView.heightAnchor.constraint(equalToConstant: 40)
        ])

    }
    
}

extension UIPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = imagesUnspalsh?.results.count ?? 0
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIImageCollectionViewCell.identifier, for: indexPath) as? UIImageCollectionViewCell else { return UIImageCollectionViewCell() }
        
        let value = imagesUnspalsh?.results[indexPath.row].urls
        if let text = value?.regular, let url = URL(string: text) {
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
    
    private func downloadPhotos(searchText: String?) {
        Network.shared.getPhotos(text: searchText ?? "Default", completion: { value, error in
            guard let value = value else {
                let text = error?.localizedDescription ?? "Что-то пошло не так в downloadPhotos"
                DispatchQueue.main.async {
                    self.alert(title: "Ошибка", message: text, actionTitle: nil)
                }
                return
            }
            
            
            self.imagesUnspalsh = value
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

extension UIPhotosViewController: SearchViewDelegate {
   func didPressSearchButton(text: String?) {
        downloadPhotos(searchText: text)
    }
    

    
    
}


//MARK: - SwiftUI
import SwiftUI
struct Provider_UIPhotosViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return UIPhotosViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = UIPhotosViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_UIPhotosViewController.ContainterView>) -> UIPhotosViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_UIPhotosViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_UIPhotosViewController.ContainterView>) {
            
        }
    }
    
}
