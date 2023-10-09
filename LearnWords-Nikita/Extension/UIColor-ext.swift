//
//  UIColor-ext.swift
//  LearnWords-Nikita
//
//  Created by Алмаз Рахматуллин on 09.10.2023.
//

import UIKit

extension UIColor {
    class var custom: CustomColor.Type { return CustomColor.self }
    
    
    class CustomColor {
        class var orange: UIColor { return UIColor(named: "Orange") ?? .systemOrange }
        class var white: UIColor { return UIColor(named: "White") ?? .white }
        class var black: UIColor { return UIColor(named: "Black") ?? .black }
        class var gray: UIColor { return UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1) }
    }
}
