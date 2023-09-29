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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Все слова"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        

    }
    
    @IBAction func barItemAction(_ sender: UIBarButtonItem) {
        
        let vc = NewWordViewContoller()
        navigationController?.pushViewController(vc, animated: true)
    }
}




//MARK: - Table View Data Source
extension UIMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? MainTableViewCell else {
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
    
    
}
