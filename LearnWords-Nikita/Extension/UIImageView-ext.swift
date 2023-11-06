//
//  UIImageView-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 06.11.2023.
//

import UIKit

extension UIImageView {
    
    convenience init(clipToBounds: Bool? = true) {
        self.init(frame: .infinite)
        self.clipsToBounds = true
    }
}
