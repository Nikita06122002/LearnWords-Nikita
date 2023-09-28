//
//  UIView-Ext.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 27.09.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
}
