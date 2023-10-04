//
//  UIMainViewController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit


class UIMainViewController: UIViewController {

    var array: [Word] = [Word(title: "Hello", translate: "Привет"),
                         Word(title: "House", translate: "Дом"),
                         Word(title: "Winter", translate: "Зима"),
                         Word(title: "Book", translate: "Книга"),
                         Word(title: "Island", translate: "Остров"),
                         Word(title: "Car", translate: "Машина"),
                         Word(title: "Street", translate: "Улица")
    ]
    
    private var tableView = UITableView()
    private var rightBarButtonItem = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupView()
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}


extension UIMainViewController {
    
    private func setupView() {
        title = "Все слова"
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        
        rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        rightBarButtonItem.tintColor = .orange
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
    }
    
    
    @objc func barItemAction() {
        
        let vc = NewWordViewContoller()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: - Table View Data Source
extension UIMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        let word = array[row]
        let title = word.title
        let translate = word.translate
        
        cell.titleLabel.text = title
        cell.translateLabel.text = translate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}

extension UIMainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Удалить") { _, _, _ in
            self.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        delete.backgroundColor = .red
        delete.image = UIImage(systemName: "xmark")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = array[indexPath.row]
        let vc = NewWordViewContoller()
        vc.delegate = self
        vc.currentWord = selectedRow
        vc.currentIndex = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension UIMainViewController: NewWordDelegate {
    func didUpdateWord(word: Word, at index: Int) {
        array[index] = word
        tableView.reloadData()
    }
    
    func didSaveNewWord(word: Word) {
        array.append(word)
        tableView.reloadData()
    }
}

//MARK: - SwiftUI
import SwiftUI
struct UIMainViewController_Provider : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return UIMainViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = UIMainViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<UIMainViewController_Provider.ContainterView>) -> UIMainViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIMainViewController_Provider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<UIMainViewController_Provider.ContainterView>) {
            
        }
    }
    
}
