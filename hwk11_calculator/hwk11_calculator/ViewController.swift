//
//  ViewController.swift
//  hwk11_calculator
//
//  Created by Kyzu on 10.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK: - calculation button size & space between topButton and textfield
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(hex: "#000000")
        setElements()
    }

    //MARK: - set elements on screen
    private func setElements() {
        //width = 5 spaces * 15 + 4 * buttonSide
        let spaceBetwenButtons: CGFloat = 15
        let buttonSide:CGFloat = (view.frame.width - 5 * spaceBetwenButtons) / 4
        print(view.frame.size)
        print(buttonSide)
        let heightOfTextField: CGFloat = 100
        //height  = spaceBetweenTopAndTextField + heightOfTextField + 6 * spaceBetwenButtons + 5 * buttonSide
        let spaceBetweenTopAndTextField = view.frame.height - heightOfTextField - 6 * spaceBetwenButtons - 5 * buttonSide
        print(spaceBetweenTopAndTextField)
        var numField = UITextField.makeTextField()
        var acButton = UIButton.makeButton(textOnButton: "AC", color: .gray)
        var plusminusButton = UIButton.makeButton(textOnButton: "±", color: .gray)
        var percentButton = UIButton.makeButton(textOnButton: "%", color: .gray)
        var divButton = UIButton.makeButton(textOnButton: "÷", color: .orange)
        
        view.addSubview(numField)
        view.addSubview(acButton)
        view.addSubview(plusminusButton)
        view.addSubview(percentButton)
        view.addSubview(divButton)
        
        
        NSLayoutConstraint.activate([
            numField.heightAnchor.constraint(equalToConstant: heightOfTextField),
            numField.topAnchor.constraint(equalTo: view.topAnchor, constant: spaceBetweenTopAndTextField),
            numField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceBetwenButtons),
            view.trailingAnchor.constraint(equalTo: numField.trailingAnchor, constant: spaceBetwenButtons)
                    
        ])
    }
    
}



