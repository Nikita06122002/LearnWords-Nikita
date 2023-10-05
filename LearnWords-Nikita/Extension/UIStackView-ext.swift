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
    
    
    convenience init(_ axis: NSLayoutConstraint.Axis,
                     _ spacing: CGFloat,
                     _ alignment: UIStackView.Alignment,
                     _ distribution: UIStackView.Distribution,
                     _ arrangedSubviews: [UIView]
    ) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.backgroundColor = .clear
        self.clipsToBounds = true
    }
}
