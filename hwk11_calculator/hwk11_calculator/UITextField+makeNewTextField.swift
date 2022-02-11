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
        tF.backgroundColor = .white
        //tF.backgroundColor = UIColor(hex: "#000000")
        return tF
    }
    
}
