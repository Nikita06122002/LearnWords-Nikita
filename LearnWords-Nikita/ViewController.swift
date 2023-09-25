//
//  ViewController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 24.09.2023.
//

import UIKit

class Test {
    var text: String = ""
}


class ViewController: UIViewController {
    var click: Int = 0
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = Test()
        value.text = "Новое значение"
        print(value.text) //1
        
//        let text = "Новое значение"
        view.backgroundColor = .yellow
        label.backgroundColor = .clear
        
        setup(string: value)
        
        print(value.text)
    }
    
    
    
    func setup(string test: Test) {
        test.text = "kasdbhlsabdkasbdkasbda"
        label.text = test.text
    }
    
    @IBAction func tapButtonAction(_ sender: UIButton) {
        startAction()
    }
    
    func startAction() {
        let text = "Новое значение"
        click += 1
        label.text = text + String(click)
    }
}

