//
//  UIFont-ext.swift
//  LearnWords-Nikita
//
//  Created by macbook on 09.11.2023.
//

import UIKit

extension UIFont {
    
    enum Montserrat: String {
        case thin = "Montserrat-Thin"
        case light = "Montserrat-Light"
        case regular = "Montserrat-Regular"
        case medium = "Montserrat-Medium"
        case bold = "Montserrat-Bold"
        case semiBoidItalic = "Montserrat-SemiBoldItalic"
    }
    
    class func montserrat(ofSize fontSize: CGFloat, weight: Montserrat) -> UIFont {
        return UIFont(name: weight.rawValue, size: fontSize) ?? systemFont(ofSize: fontSize)
    }
    
}
