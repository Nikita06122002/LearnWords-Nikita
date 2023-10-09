//
//  UIColor-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 09.10.2023.
//

import UIKit

extension UIColor {
    class var custom: CustomColor.Type { return CustomColor.self}
    
    class CustomColor {
        class var orange: UIColor { return UIColor(named: "Orange") ?? .systemOrange }
        class var white: UIColor { return UIColor(named: "White") ?? .white }
        class var black: UIColor { return UIColor(named: "Black") ?? .black }
        class var gray: UIColor { return UIColor(named: "Gray") ?? .systemGray }
        class var blue: UIColor { return UIColor(named: "Blue") ?? .systemBlue }
        class var green: UIColor { return UIColor(named: "Green") ?? .systemGreen }
        class var red: UIColor { return UIColor(named: "Red") ?? .systemRed }



    }
}
