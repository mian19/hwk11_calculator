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
    
    return returnStr
}
