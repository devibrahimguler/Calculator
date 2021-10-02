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
        HStack {
            var nums : [String] = []
            HStack{
                VStack{
                    
                    ElseButtons(action: {
                        self.firstNumber = ""
                        nums.removeAll()
                    }, elseText: "Clear")
                    
                    HStack{
                        NumberButtons(action: {
                            self.firstNumber += "7"
                        }, numberText: "7")
                        
                        NumberButtons(action: {
                            self.firstNumber += "8"
                        }, numberText: "8")
                        
                        NumberButtons(action: {
                            self.firstNumber += "9"
                        }, numberText: "9")
                    }
                    
                    HStack{
                        NumberButtons(action: {
                            self.firstNumber += "4"
                        }, numberText: "4")
                        
                        NumberButtons(action: {
                            self.firstNumber += "5"
                        }, numberText: "5")
                        
                        NumberButtons(action: {
                            self.firstNumber += "6"
                        }, numberText: "6")
                    }
                    
                    HStack{
                        NumberButtons(action: {
                            self.firstNumber += "1"
                        }, numberText: "1")
                        
                        NumberButtons(action: {
                            self.firstNumber += "2"
                        }, numberText: "2")
                        
                        NumberButtons(action: {
                            self.firstNumber += "3"
                        }, numberText: "3")
                    }
                    
                    ElseButtons(action: {
                        self.firstNumber += "0"
                    }, elseText: "0")
                }
            }
            
            VStack {
                CalculateButton(action: {
                    if self.firstNumber != "" {
                        nums.append(self.firstNumber)
                        self.firstNumber = ""
                        nums.append("÷")
                    }
                }, iconText: "÷")
                
                
                CalculateButton(action: {
                    if self.firstNumber != "" {
                        nums.append(self.firstNumber)
                        self.firstNumber = ""
                        nums.append("x")
                    }
                }, iconText: "x")
                
                
                CalculateButton(action: {
                    if self.firstNumber != "" {
                        nums.append(self.firstNumber)
                        self.firstNumber = ""
                        nums.append("-")
                    }
                }, iconText: "-")
                
                
                CalculateButton(action: {
                    if self.firstNumber != "" {
                        nums.append(self.firstNumber)
                        self.firstNumber = ""
                        nums.append("+")
                    }
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
