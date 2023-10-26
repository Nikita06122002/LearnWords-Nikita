//
//  UITextField-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 26.10.2023.
//

import UIKit

extension UITextField {
    
    convenience init(borderStyle: BorderStyle, font: UIFont) {
        self.init(frame: .infinite)
        self.borderStyle = borderStyle
        self.font = font
    }
}
