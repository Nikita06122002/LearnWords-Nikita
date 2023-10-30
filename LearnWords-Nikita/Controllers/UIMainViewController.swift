//
//  UIMainViewController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit
import AVKit

final class UIMainViewController: ViewController, AVKitProtocol {
    
    var synthesizer: AVSpeechSynthesizer!
    
    private var words = RealmManager.shared.words
    
    private var tableView = UITableView(backgroungColor: .clear)
    private var rightBarButtonItem = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupView()
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        //        print(RealmManager.shared.realm.configuration.fileURL)
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

//MARK: - Table View Data Source
extension UIMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row < words.count {
            
            let word = words[indexPath.row]
            cell.setupView(word: word)
            cell.setPlayButtonTag(indexPath.row)
            cell.addTarget(self, action: #selector(playButtonAction(_:)))
        }
        
        
        return cell
    }
    
    
    @objc private func playButtonAction(_ sender: UIButton) {
        
        let row = sender.tag
        let word = words[row]
        alert(title: word.title, message: word.translate, actionTitle: "Воспроизвести") { _ in
            self.playSound(word.title, language: "en-US")
        }
    }
    
}

extension UIMainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completion in
            let word = self.words[indexPath.row]
            RealmManager.shared.delete(word: word)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
            self.tableView.reloadData()
        }
        delete.backgroundColor = .custom.red
        delete.image = UIImage(systemName: "xmark")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < words.count {
            let selectedRow = words[indexPath.row]
            let vc = NewWordViewContoller()
            vc.delegate = self
            vc.currentWord = selectedRow
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
}

extension UIMainViewController: NewWordDelegate {
    func didUpdateWord(word: Word) {
        RealmManager.shared.edit(word: word)
        words = RealmManager.shared.words
        tableView.reloadData()
    }
    
    func didSaveNewWord(word: Word) {
        RealmManager.shared.save(word: word)
        words = RealmManager.shared.words
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
