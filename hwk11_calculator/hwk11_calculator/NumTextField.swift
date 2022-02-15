//
//  UITextField+makeNewTextField.swift
//  hwk11_calculator
//
//  Created by Kyzu on 11.02.22.
//

import Foundation
import UIKit

class NumTextField: UITextField {
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    static func makeTextField() -> NumTextField {
        let tF = NumTextField()
        tF.translatesAutoresizingMaskIntoConstraints = false
        tF.textAlignment = .right
        tF.backgroundColor = UIColor(hex: "#000000")
        tF.textColor = .white
        tF.tintColor = .clear
        tF.inputView = UIView()
        tF.font = UIFont(name: "AvenirNextCondensed-Regular", size: 60)
        return tF
    }
}
