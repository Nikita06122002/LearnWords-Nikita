//
//  UITableViewCell-ext.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 05.10.2023.
//

import UIKit

extension UITableViewCell {
    
    class var identifier: String { return String(describing: Self.self) }
    
    func clearBackgroundColor() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
}
