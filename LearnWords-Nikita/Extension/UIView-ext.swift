//
//  UIView-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit

extension UIView {
    
    convenience init(color: UIColor = .clear, radius: CGFloat = 0) {
        self.init()
        self.backgroundColor = color
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addSubViews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
}
