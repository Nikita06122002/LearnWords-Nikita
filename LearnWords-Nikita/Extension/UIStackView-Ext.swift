//
//  UIStackView-Ext.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 27.09.2023.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
