//
//  UIButton+makeNewButton.swift
//  hwk11_calculator
//
//  Created by Kyzu on 11.02.22.
//

import Foundation
import UIKit

extension UIButton {
    
    enum Color: String {
        case black = "#000000"
        case darkGray = "#2d2d2d"
        case white = "#ffffff"
        case gray = "#9c9c9c"
        case orange = "#fe9427"
    }
    
    static func makeButton(textOnButton: String, color: Color = .darkGray) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.init(hex: color.rawValue)
        button.titleLabel?.text = textOnButton
        
        return button
    }
    
}
