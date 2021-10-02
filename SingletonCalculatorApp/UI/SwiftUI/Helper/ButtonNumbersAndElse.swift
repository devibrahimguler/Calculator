//
//  ButtonsNumberAndElse.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonNumbersAndElse: View {
    
    @Binding var firstNumber : String
    @State var nums : [String] = []
    
    var body: some View {
        HStack(spacing: 0.0) {
           
            HStack{
                VStack{
                    
                    ButtonElse(action: {
                        self.firstNumber = "0"
                        nums.removeAll()
                    }, elseText: "Clear")
                    
                    HStack{
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "7")
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "8")
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "9")
                    }
                    
                    HStack{
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "4")
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "5")
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "6")
                    }
                    
                    HStack{
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "1")
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "2")
                        ButtonNumbers(strNumber: self.$firstNumber, numberText: "3")
                    }
                    
                    ButtonElse(action: {
                        if self.firstNumber.first == "0" {
                            self.firstNumber.removeFirst()
                        }
                        self.firstNumber += "0"
                    }, elseText: "0")
                }
            }
            
            VStack {
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "÷")
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "x")
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "-")
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "+")
                ButtonEqual(firstNumber: self.$firstNumber, nums: self.$nums)   
            }
        }.padding(.all, 5)
    }
}

struct ButtonNumbersAndElse_Previews: PreviewProvider {
    @State static var firstNumber : String = ""
    static var previews: some View {
        ButtonNumbersAndElse(firstNumber: self.$firstNumber)
    }
}
