//
//  UILabel-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 03.10.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String?, font: UIFont? = nil, textColor: UIColor = .black) {
        self.init()
        self.text = text
        if let font = font {
            self.font = font
        }
        self.textColor = textColor
    }
    
}
