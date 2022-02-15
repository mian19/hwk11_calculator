//
//  ViewController.swift
//  hwk11_calculator
//
//  Created by Kyzu on 10.02.22.
//

import UIKit

class ViewController: UIViewController {
    private var numField: NumTextField!
    //numFieldSize
    private var numberOfFiguresInNumField: Int = 0
    
    private let itemCopy = UIMenuItem(title: "Copy", action: #selector(copyFromNumField))
    private let itemPaste = UIMenuItem(title: "Paste", action: #selector(pasteToNumField))
    
    //memory buffer
    private var memoryBuffer: String = ""
    
    private var acButton: UIButton!
    private var plusminusButton: UIButton!
    private var percentButton: UIButton!
    private var divButton: UIButton!
    private var sevenButton: UIButton!
    private var eightButton: UIButton!
    private var nineButton: UIButton!
    private var multButton: UIButton!
    private var fourButton: UIButton!
    private var fiveButton: UIButton!
    private var sixButton: UIButton!
    private var minusButton: UIButton!
    private var oneButton: UIButton!
    private var twoButton: UIButton!
    private var threeButton: UIButton!
    private var plusButton: UIButton!
    private var zeroButton: UIButton!
    private var dotButton: UIButton!
    private var equalButton: UIButton!
    
    private var shadow = UIView()
    private var activeAction: String = ""
    private var num1: String = ""
    private var num2: String = ""
    
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
        workWithAddMenu()
        workWithButtons()
    }
    
    //MARK: - set elements on screen
    private func setElements() {
        //width = 5 spaces * 15 + 4 * buttonSide
        let spaceBetwenButtons: CGFloat = 15
        let buttonSide:CGFloat = (view.frame.width - 5 * spaceBetwenButtons) / 4
        let heightOfTextField: CGFloat = 100
        //height  = spaceBetweenTopAndTextField + heightOfTextField + 6 * spaceBetwenButtons + 5 * buttonSide
        let spaceBetweenTopAndTextField = view.frame.height - heightOfTextField - 6 * spaceBetwenButtons - 5 * buttonSide
        numField = NumTextField.makeTextField()
        numField.text = "0"
        acButton = UIButton.makeButton(textOnButton: "AC", buttonSide: buttonSide, color: .gray, textColor: .black)
        plusminusButton = UIButton.makeButton(textOnButton: "±", buttonSide: buttonSide, color: .gray, textColor: .black)
        percentButton = UIButton.makeButton(textOnButton: "%", buttonSide: buttonSide, color: .gray, textColor: .black)
        divButton = UIButton.makeButton(textOnButton: "÷", buttonSide: buttonSide, color: .orange)
        sevenButton = UIButton.makeButton(textOnButton: "7", buttonSide: buttonSide)
        eightButton = UIButton.makeButton(textOnButton: "8", buttonSide: buttonSide)
        nineButton = UIButton.makeButton(textOnButton: "9", buttonSide: buttonSide)
        multButton = UIButton.makeButton(textOnButton: "×", buttonSide: buttonSide, color: .orange)
        fourButton = UIButton.makeButton(textOnButton: "4", buttonSide: buttonSide)
        fiveButton = UIButton.makeButton(textOnButton: "5", buttonSide: buttonSide)
        sixButton = UIButton.makeButton(textOnButton: "6", buttonSide: buttonSide)
        minusButton = UIButton.makeButton(textOnButton: "—", buttonSide: buttonSide, color: .orange)
        oneButton = UIButton.makeButton(textOnButton: "1", buttonSide: buttonSide)
        twoButton = UIButton.makeButton(textOnButton: "2", buttonSide: buttonSide)
        threeButton = UIButton.makeButton(textOnButton: "3", buttonSide: buttonSide)
        plusButton = UIButton.makeButton(textOnButton: "+", buttonSide: buttonSide, color: .orange)
        zeroButton = UIButton.makeButton(textOnButton: "    0", buttonSide: buttonSide)
        zeroButton.contentHorizontalAlignment = .left
        dotButton = UIButton.makeButton(textOnButton: ",", buttonSide: buttonSide)
        equalButton = UIButton.makeButton(textOnButton: "=", buttonSide: buttonSide, color: .orange)
        
        let arrayOfButtons: [UIButton] = [acButton, plusminusButton, percentButton, sevenButton, eightButton, nineButton, fourButton, fiveButton, sixButton, oneButton, twoButton, threeButton, dotButton, zeroButton, equalButton, multButton, minusButton, divButton, plusButton]
        
        view.addSubview(numField)
        
        for button in arrayOfButtons {
            view.addSubview(button)
            button.addTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
            button.addTarget(self, action: #selector(touchUp), for: [.touchUpOutside, .touchDragOutside, .touchUpInside])
        }
        
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
    
    private func workWithButtons() {
        let arrayOfNum: [UIButton] = [sevenButton, eightButton, nineButton, fourButton, fiveButton, sixButton, oneButton, twoButton, threeButton]
        let arrayOfActions: [UIButton] = [divButton, multButton, minusButton, plusButton]
        
        for button in arrayOfNum {
            button.addTarget(self, action: #selector(pressedNum), for: .touchUpInside)
        }
        
        for button in arrayOfActions {
            button.addTarget(self, action: #selector(pressedAction), for: .touchUpInside)
        }
        
        dotButton.addTarget(self, action: #selector(pressedDot), for: .touchUpInside)
        acButton.addTarget(self, action: #selector(pressedAC), for: .touchUpInside)
        plusminusButton.addTarget(self, action: #selector(pressedPlusMinus), for: .touchUpInside)
        zeroButton.addTarget(self, action: #selector(pressedZero), for: .touchUpInside)
        percentButton.addTarget(self, action: #selector(pressedPercent), for: .touchUpInside)
        
    }
    
    private func workWithAddMenu() {
        //Add custom copy|paste
        UIMenuController.shared.menuItems = [itemCopy]
    }
    
    @objc private func touchDown(sender: UIButton) {
        
        shadow = UIView(frame: sender.frame)
        shadow.backgroundColor = .init(white: 1, alpha: 0.3)
        shadow.frame.origin = sender.frame.origin
        shadow.layer.cornerRadius = shadow.frame.height / 2
        shadow.layer.masksToBounds = true
        view.addSubview(shadow)
    }
    
    @objc private func touchUp() {
        UIView.animate(withDuration: 0.45, animations: {
            self.shadow.layer.opacity = 0
        }, completion: {_ in
            self.shadow.removeFromSuperview()
        })
    }
    
    @objc private func pressedNum(sender: UIButton) {
        if numField.text == "0" || numField.text == "Error" {
            numField.text = sender.titleLabel?.text
            acButton.setTitle("C", for: .normal)
            numberOfFiguresInNumField += 1
        } else if (numField.text == "-0") {
            numField.text = "-" + (sender.titleLabel?.text)!
            acButton.setTitle("C", for: .normal)
        } else if numberOfFiguresInNumField < 9 {
            numField.text! += (sender.titleLabel?.text)!
            numberOfFiguresInNumField += 1
        }
    }
    
    @objc private func pressedZero(sender: UIButton) {
        if numField.text! == "0" || numField.text! == "-0"   {
            return
        } else if numField.text == "Error" {
            numField.text = "0"
            numberOfFiguresInNumField += 1
        } else {
            numField.text! += "0"
            numberOfFiguresInNumField += 1
        }
    }
    
    @objc private func pressedDot() {
        if numField.text == "Error" {
            numField.text = "0,"
            acButton.setTitle("C", for: .normal)
        } else if (numberOfFiguresInNumField < 9 && !numField.text!.contains(",") ) {
            numField.text! += ","
            acButton.setTitle("C", for: .normal)
        }
    }
    
    @objc private func pressedAC() {
        switch numField.text {
        case "0":
            break
        default:
            numField.text = "0"
            numberOfFiguresInNumField = 0
            acButton.setTitle("AC", for: .normal)
        }
    }
    
    @objc private func pressedPlusMinus() {
        if !numField.text!.contains("-")  && numField.text != "Error" {
            numField.text! = "-" + numField.text!
            acButton.setTitle("C", for: .normal)
        } else if numField.text == "Error" {
            numField.text = "0,"
            acButton.setTitle("C", for: .normal)
        } else if numField.text!.contains("-") {
            numField.text = String(numField.text!.dropFirst())
        }
    }
    
    @objc private func pressedPercent() {
        if numField.text == "Error" {
            return
        }
        numField.text = percent(userInput: numField.text!)
    }
    
    @objc private func pressedAction(sender: UIButton) {
        activeAction = (sender.titleLabel?.text)!
        sender.backgroundColor = .white
        sender.setTitleColor(UIColor.init(hex: "#fe9427" ), for: .normal)
    }
    
    @objc private func copyFromNumField() {
        memoryBuffer += numField.text!
        UIMenuController.shared.menuItems = [itemCopy, itemPaste]
    }
    
    @objc private func pasteToNumField() {
        numField.text = memoryBuffer
    }
    
}





