//
//  UIMainViewController.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 27.09.2023.
//

import UIKit

class UIMainViewController: UIViewController, UITableViewDataSource {
    var array: [Word] = [ Word(title: "Hello", translate: "Привет"),
                          Word(title: "House", translate: "Дом"),
                          Word(title: "Winter", translate: "Зима"),
                          Word(title: "Book", translate: "Книга"),
                          Word(title: "Island", translate: "Остров")]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Все слова"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
    }
    

    @IBAction func barItemAction(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
    
    //MARK: - Table View Data Sourse
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = array.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        print(row)
        let word = array[row]
        let title = word.title
        let translate = word.translate
        
        cell.titleLabel.text = title
        cell.translateLabel.text = translate
        
        return cell
    }
}
