//
//  ButtonsNumberAndElse.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonNumbersAndElse: View {
    
    @Binding var firstNumber : String
    @Binding var nums : [String]
    
    var body: some View {
        HStack(spacing: 0.0) {
           
            HStack{
                VStack{
                    
                    ButtonElse(action: {
                        self.firstNumber = "0"
                        nums.removeAll()
                    }, elseText: "Clear")
                    
                    HStack {
                        ForEach(Range(7...9), id: \.self) { i in
                            ButtonNumbers(strNumber: self.$firstNumber, nums: self.$nums, numberText: String(i))
                        }
                    }
                    
                    HStack {
                        ForEach(Range(4...6), id: \.self) { i in
                            ButtonNumbers(strNumber: self.$firstNumber, nums: self.$nums, numberText: String(i))
                        }
                    }
                    
                    HStack {
                        ForEach(Range(1...3), id: \.self) { i in
                            ButtonNumbers(strNumber: self.$firstNumber, nums: self.$nums, numberText: String(i))
                        }
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
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "÷", color: .orange)
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "x", color: .orange)
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "-", color: .orange)
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "+", color: .orange)
                ButtonEqual(firstNumber: self.$firstNumber, nums: self.$nums)   
            }
        }.padding(.all, 5)
    }
}

struct ButtonNumbersAndElse_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNumbersAndElseTests()
    }
    
    // We want to working system so we tested system piece and we tested sytem.
    struct ButtonNumbersAndElseTests : View {
        @State var firstNumber : String = ""
        @State var nums : [String] = []

        var body: some View {
            VStack {
                
                ButtonNumbersAndElse(firstNumber: self.$firstNumber, nums: self.$nums)
                
                Spacer()
                
                HStack {
                    Text("Result: \(self.firstNumber)")
                        .font(.largeTitle)
                    
                    Spacer()
                }.padding()
                
                Spacer()
             
            }
        }
    }
}
