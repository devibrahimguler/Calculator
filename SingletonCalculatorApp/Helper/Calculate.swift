//
//  Calculate.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//
internal struct Calculate {
    
    static let calculate = Calculate()
    
    internal func toAdd(num1 :Int = 0, num2 :Int = 0) -> Int {
        return num1 + num2
    }
    
    internal func toSubtract(num1 :Int = 0, num2 :Int = 0)  -> Int {
        return num1 - num2
    }
    
    internal func toMultiply(num1 :Int = 0, num2 :Int = 0) -> Int {
        return num1 * num2
    }
    
    internal func toDivide(num1 :Int = 0, num2 :Int = 0)  -> Int {
        if(num2 == 0) {
            return num2
        }
        return num1 / num2
    }
    
}
