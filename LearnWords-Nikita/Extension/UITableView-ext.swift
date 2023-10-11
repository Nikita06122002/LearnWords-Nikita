//
//  UITableView-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 11.10.2023.
//

import UIKit

extension UITableView {
    
    convenience init(backgroungColor: UIColor? = .clear) {
        self.init()
        self.backgroundColor = backgroungColor
    }
}
