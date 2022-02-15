//
//  MathFunctions.swift
//  hwk11_calculator
//
//  Created by Kyzu on 14.02.22.
//

import Foundation

func percent(userInput: String) -> String{
    var convertedNum: Double = converterFrom(str: userInput)
    convertedNum /= 100
    
    return converterTo(num: convertedNum)
}

func mathSolving(num1: String, num2: String, action: String) -> String {
    let convertedNum1 = converterFrom(str: num1)
    let convertedNum2 = converterFrom(str: num2)
    var returnVal: Double!
    switch action {
    case "+":
        returnVal = (convertedNum1 + convertedNum2)
    case "—":
        returnVal = (convertedNum1 - convertedNum2)
    case "÷":
        if convertedNum2 == 0 {
            return "Error"
        }
        returnVal = (convertedNum1 / convertedNum2)
    case "×":
        returnVal = (convertedNum1 * convertedNum2)
    default:
        break
    }
    
    return converterTo(num: returnVal)
}

//MARK: - func for convert from String to Double
private func converterFrom(str: String) -> Double {
    var returnNum: Double = 0
    
    if str.contains(",") {
        returnNum = Double(str.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)) ?? 0
    } else {
        returnNum = Double(str) ?? 0
    }
    return returnNum
}

//MARK: - func for convert from Double to String
private func converterTo(num: Double) -> String {
    var returnStr: String = ""
    returnStr = String(Double(round(10000 * num) / 10000))
    
    if returnStr.contains(".") {
        returnStr = returnStr.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
    
    if returnStr.suffix(2) == ",0" {
        returnStr = String(returnStr.dropLast(2))
    }
    
    return returnStr
}
