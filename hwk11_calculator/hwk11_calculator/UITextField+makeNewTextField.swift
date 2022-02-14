//
//  UITextField+makeNewTextField.swift
//  hwk11_calculator
//
//  Created by Kyzu on 11.02.22.
//

import Foundation
import UIKit



extension UITextField {
    static func makeTextField() -> UITextField {
        let tF = UITextField()
        tF.translatesAutoresizingMaskIntoConstraints = false
        tF.textAlignment = .right
        tF.backgroundColor = UIColor(hex: "#000000")
        tF.textColor = .white
        tF.tintColor = .clear
        tF.isUserInteractionEnabled = false
        tF.font = UIFont(name: "AvenirNextCondensed-Regular", size: 60)
        return tF
    }
    
}
