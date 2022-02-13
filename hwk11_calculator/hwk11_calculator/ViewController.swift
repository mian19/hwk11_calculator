//
//  ViewController.swift
//  hwk11_calculator
//
//  Created by Kyzu on 10.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - design for status bar
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

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
        let heightOfTextField: CGFloat = 100
        //height  = spaceBetweenTopAndTextField + heightOfTextField + 6 * spaceBetwenButtons + 5 * buttonSide
        let spaceBetweenTopAndTextField = view.frame.height - heightOfTextField - 6 * spaceBetwenButtons - 5 * buttonSide
        let numField = UITextField.makeTextField()
        
        let acButton = UIButton.makeButton(textOnButton: "AC", buttonSide: buttonSide, color: .gray, textColor: .black)
        let plusminusButton = UIButton.makeButton(textOnButton: "±", buttonSide: buttonSide, color: .gray, textColor: .black)
        let percentButton = UIButton.makeButton(textOnButton: "%", buttonSide: buttonSide, color: .gray, textColor: .black)
        let divButton = UIButton.makeButton(textOnButton: "÷", buttonSide: buttonSide, color: .orange)
        let sevenButton = UIButton.makeButton(textOnButton: "7", buttonSide: buttonSide)
        let eightButton = UIButton.makeButton(textOnButton: "8", buttonSide: buttonSide)
        let nineButton = UIButton.makeButton(textOnButton: "9", buttonSide: buttonSide)
        let multButton = UIButton.makeButton(textOnButton: "x", buttonSide: buttonSide, color: .orange)
        let fourButton = UIButton.makeButton(textOnButton: "4", buttonSide: buttonSide)
        let fiveButton = UIButton.makeButton(textOnButton: "5", buttonSide: buttonSide)
        let sixButton = UIButton.makeButton(textOnButton: "6", buttonSide: buttonSide)
        let minusButton = UIButton.makeButton(textOnButton: "—", buttonSide: buttonSide, color: .orange)
        let oneButton = UIButton.makeButton(textOnButton: "1", buttonSide: buttonSide)
        let twoButton = UIButton.makeButton(textOnButton: "2", buttonSide: buttonSide)
        let threeButton = UIButton.makeButton(textOnButton: "3", buttonSide: buttonSide)
        let plusButton = UIButton.makeButton(textOnButton: "+", buttonSide: buttonSide, color: .orange)
        let zeroButton = UIButton.makeButton(textOnButton: "     0", buttonSide: buttonSide)
        zeroButton.contentHorizontalAlignment = .left
        let dotButton = UIButton.makeButton(textOnButton: ",", buttonSide: buttonSide)
        let equalButton = UIButton.makeButton(textOnButton: "=", buttonSide: buttonSide, color: .orange)
        
        
        view.addSubview(numField)
        view.addSubview(acButton)
        view.addSubview(plusminusButton)
        view.addSubview(percentButton)
        view.addSubview(divButton)
        view.addSubview(sevenButton)
        view.addSubview(eightButton)
        view.addSubview(nineButton)
        view.addSubview(multButton)
        view.addSubview(fourButton)
        view.addSubview(fiveButton)
        view.addSubview(sixButton)
        view.addSubview(minusButton)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(plusButton)
        view.addSubview(zeroButton)
        view.addSubview(dotButton)
        view.addSubview(equalButton)
        
        
        //MARK: - add constraints
        NSLayoutConstraint.activate([
            //textField
            numField.heightAnchor.constraint(equalToConstant: heightOfTextField),
            numField.topAnchor.constraint(equalTo: view.topAnchor, constant: spaceBetweenTopAndTextField),
            numField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceBetwenButtons),
            view.trailingAnchor.constraint(equalTo: numField.trailingAnchor, constant: spaceBetwenButtons),
            
            acButton.heightAnchor.constraint(equalToConstant: buttonSide),
            acButton.widthAnchor.constraint(equalToConstant: buttonSide),
            acButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceBetwenButtons),
            acButton.topAnchor.constraint(equalTo: numField.bottomAnchor, constant: spaceBetwenButtons),
            
            plusminusButton.heightAnchor.constraint(equalToConstant: buttonSide),
            plusminusButton.widthAnchor.constraint(equalToConstant: buttonSide),
            plusminusButton.leadingAnchor.constraint(equalTo: acButton.trailingAnchor, constant: spaceBetwenButtons),
            plusminusButton.topAnchor.constraint(equalTo: numField.bottomAnchor, constant: spaceBetwenButtons),
            
            percentButton.heightAnchor.constraint(equalToConstant: buttonSide),
            percentButton.widthAnchor.constraint(equalToConstant: buttonSide),
            percentButton.leadingAnchor.constraint(equalTo: plusminusButton.trailingAnchor, constant: spaceBetwenButtons),
            percentButton.topAnchor.constraint(equalTo: numField.bottomAnchor, constant: spaceBetwenButtons),
            
            divButton.heightAnchor.constraint(equalToConstant: buttonSide),
            divButton.widthAnchor.constraint(equalToConstant: buttonSide),
            divButton.topAnchor.constraint(equalTo: numField.bottomAnchor, constant: spaceBetwenButtons),
            view.trailingAnchor.constraint(equalTo: divButton.trailingAnchor, constant: spaceBetwenButtons),
            
            sevenButton.heightAnchor.constraint(equalToConstant: buttonSide),
            sevenButton.widthAnchor.constraint(equalToConstant: buttonSide),
            sevenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceBetwenButtons),
            sevenButton.topAnchor.constraint(equalTo: acButton.bottomAnchor, constant: spaceBetwenButtons),
            
            eightButton.heightAnchor.constraint(equalToConstant: buttonSide),
            eightButton.widthAnchor.constraint(equalToConstant: buttonSide),
            eightButton.leadingAnchor.constraint(equalTo: sevenButton.trailingAnchor, constant: spaceBetwenButtons),
            eightButton.topAnchor.constraint(equalTo: acButton.bottomAnchor, constant: spaceBetwenButtons),
            
            nineButton.heightAnchor.constraint(equalToConstant: buttonSide),
            nineButton.widthAnchor.constraint(equalToConstant: buttonSide),
            nineButton.leadingAnchor.constraint(equalTo: eightButton.trailingAnchor, constant: spaceBetwenButtons),
            nineButton.topAnchor.constraint(equalTo: acButton.bottomAnchor, constant: spaceBetwenButtons),
            
            multButton.heightAnchor.constraint(equalToConstant: buttonSide),
            multButton.widthAnchor.constraint(equalToConstant: buttonSide),
            multButton.topAnchor.constraint(equalTo: acButton.bottomAnchor, constant: spaceBetwenButtons),
            view.trailingAnchor.constraint(equalTo: multButton.trailingAnchor, constant: spaceBetwenButtons),
            
            fourButton.heightAnchor.constraint(equalToConstant: buttonSide),
            fourButton.widthAnchor.constraint(equalToConstant: buttonSide),
            fourButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceBetwenButtons),
            fourButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: spaceBetwenButtons),

            fiveButton.heightAnchor.constraint(equalToConstant: buttonSide),
            fiveButton.widthAnchor.constraint(equalToConstant: buttonSide),
            fiveButton.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor, constant: spaceBetwenButtons),
            fiveButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: spaceBetwenButtons),

            sixButton.heightAnchor.constraint(equalToConstant: buttonSide),
            sixButton.widthAnchor.constraint(equalToConstant: buttonSide),
            sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor, constant: spaceBetwenButtons),
            sixButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: spaceBetwenButtons),

            minusButton.heightAnchor.constraint(equalToConstant: buttonSide),
            minusButton.widthAnchor.constraint(equalToConstant: buttonSide),
            minusButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: spaceBetwenButtons),
            view.trailingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: spaceBetwenButtons),
            
            oneButton.heightAnchor.constraint(equalToConstant: buttonSide),
            oneButton.widthAnchor.constraint(equalToConstant: buttonSide),
            oneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceBetwenButtons),
            oneButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: spaceBetwenButtons),

            twoButton.heightAnchor.constraint(equalToConstant: buttonSide),
            twoButton.widthAnchor.constraint(equalToConstant: buttonSide),
            twoButton.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor, constant: spaceBetwenButtons),
            twoButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: spaceBetwenButtons),

            threeButton.heightAnchor.constraint(equalToConstant: buttonSide),
            threeButton.widthAnchor.constraint(equalToConstant: buttonSide),
            threeButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor, constant: spaceBetwenButtons),
            threeButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: spaceBetwenButtons),

            plusButton.heightAnchor.constraint(equalToConstant: buttonSide),
            plusButton.widthAnchor.constraint(equalToConstant: buttonSide),
            plusButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: spaceBetwenButtons),
            view.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: spaceBetwenButtons),
            
            zeroButton.heightAnchor.constraint(equalToConstant: buttonSide),
            zeroButton.widthAnchor.constraint(equalToConstant: buttonSide * 2 + spaceBetwenButtons),
            zeroButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spaceBetwenButtons),
            zeroButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: spaceBetwenButtons),


            dotButton.heightAnchor.constraint(equalToConstant: buttonSide),
            dotButton.widthAnchor.constraint(equalToConstant: buttonSide),
            dotButton.leadingAnchor.constraint(equalTo: zeroButton.trailingAnchor, constant: spaceBetwenButtons),
            dotButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: spaceBetwenButtons),

            equalButton.heightAnchor.constraint(equalToConstant: buttonSide),
            equalButton.widthAnchor.constraint(equalToConstant: buttonSide),
            equalButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: spaceBetwenButtons),
            view.trailingAnchor.constraint(equalTo: equalButton.trailingAnchor, constant: spaceBetwenButtons),
                    
        ])
    }
    
}



