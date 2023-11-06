//
//  UIPhotosViewController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 10.10.2023.
//

import UIKit
import SDWebImage

class UIPhotosViewController: ViewController {
    
    private var imagesUnspalsh: Unsplash?
  
    weak var delegate: UIPhotosViewControllerProtocol?
    
    private let spacing = 5.0
    
    private lazy var collectionView = UICollectionView(backgroundColor: .clear, frame: view.bounds, spacing: 5)
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UIImageCollectionViewCell.self, forCellWithReuseIdentifier: UIImageCollectionViewCell.identifier)
        setupSearchController()
        initialize()
        setupView()
    }
    
    func initialize() {
        view.addSubViews(collectionView)

    }
    
    private func setupSearchController() {
        
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск изображений"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
    
    private func setupView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    

    
}

extension UIPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = imagesUnspalsh?.results.count ?? 0
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIImageCollectionViewCell.identifier, for: indexPath) as? UIImageCollectionViewCell else { return UIImageCollectionViewCell()
        }
        
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
                let text = error?.description
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


// Расширение для обработки  поиска
extension UIPhotosViewController: UISearchBarDelegate {
    // Вызывается, когда текст изменяется
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        downloadPhotos(searchText: searchText)
    }
    
    // Вызывается, когда пользователь нажимает кнопку
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text {
            downloadPhotos(searchText: searchText)
        }
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
