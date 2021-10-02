//
//  ButtonsNumberAndElse.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonsNumberAndElse: View {
    
    @Binding var firstNumber : String
    @State var nums : [String] = []
    
    var body: some View {
        HStack(spacing: 0.0) {
           
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
                CalculateButton(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "÷")
                CalculateButton(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "x")
                CalculateButton(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "-")
                CalculateButton(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "+")
                EqualsButton(firstNumber: self.$firstNumber, nums: self.$nums)   
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
