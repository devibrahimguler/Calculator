//
//  ButtonsNumberAndElse.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonsNumberAndElse: View {
    
    @Binding var firstNumber : String
    
    var calculater = Calculate()
    
    var body: some View {
        HStack(spacing: 0.0) {
            var nums : [String] = []
            HStack{
                VStack{
                    
                    ElseButtons(action: {
                        self.firstNumber = "0"
                        nums.removeAll()
                    }, elseText: "Clear")
                    
                    HStack{
                        NumberButtons(strNumber: self.$firstNumber, numberText: "7")
                        NumberButtons(strNumber: self.$firstNumber, numberText: "8")
                        NumberButtons(strNumber: self.$firstNumber, numberText: "9")
                    }
                    
                    HStack{
                        NumberButtons(strNumber: self.$firstNumber, numberText: "4")
                        NumberButtons(strNumber: self.$firstNumber, numberText: "5")
                        NumberButtons(strNumber: self.$firstNumber, numberText: "6")
                    }
                    
                    HStack{
                        NumberButtons(strNumber: self.$firstNumber, numberText: "1")
                        NumberButtons(strNumber: self.$firstNumber, numberText: "2")
                        NumberButtons(strNumber: self.$firstNumber, numberText: "3")
                    }
                    
                    ElseButtons(action: {
                        if self.firstNumber.first == "0" {
                            self.firstNumber.removeFirst()
                        }
                        self.firstNumber += "0"
                    }, elseText: "0")
                }
            }
            
            VStack {
                CalculateButton(action: {
                    nums.append(self.firstNumber)
                    self.firstNumber = "0"
                    nums.append("÷")
                }, iconText: "÷")
                
                
                CalculateButton(action: {
                    nums.append(self.firstNumber)
                    self.firstNumber = "0"
                    nums.append("x")
                }, iconText: "x")
                
                
                CalculateButton(action: {
                    nums.append(self.firstNumber)
                    self.firstNumber = "0"
                    nums.append("-")
                }, iconText: "-")
                
                
                CalculateButton(action: {
                    nums.append(self.firstNumber)
                    self.firstNumber = "0"
                    nums.append("+")
                }, iconText: "+")
            
                
                CalculateButton(action: {
                    if self.firstNumber != "" {
                        nums.append(self.firstNumber)
                        
                        var value = Int(nums[0]) ?? 0
                        var i = 0
                        while i < nums.count {
                            if nums[i] == "+"{
                                value = calculater.toAdd(num1: value, num2: Int(nums[i+1]) ?? 0)
                            } else if nums[i] == "-" {
                                value = calculater.toSubtract(num1: value, num2: Int(nums[i+1]) ?? 0)
                            } else if nums[i] == "x" {
                                value = calculater.toMultiply(num1: value, num2: Int(nums[i+1]) ?? 0)
                            } else if nums[i] == "÷" {
                                value = calculater.toDivide(num1: value, num2: Int(nums[i+1]) ?? 0)
                            }
                            i += 1
                        }
                        
                        nums.removeAll()
                        
                        self.firstNumber = String(value)
                    }
                    
                }, iconText: "=")
                
            }
        }.padding(.all, 5)
    }
}

struct ButtonsNumberAndElse_Previews: PreviewProvider {
    @State static var firstNumber : String = ""
    static var previews: some View {
        ButtonsNumberAndElse(firstNumber: self.$firstNumber)
    }
}
