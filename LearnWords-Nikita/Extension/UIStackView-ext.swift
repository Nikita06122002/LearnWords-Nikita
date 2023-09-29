//
//  UIStackView-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 28.09.2023.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
