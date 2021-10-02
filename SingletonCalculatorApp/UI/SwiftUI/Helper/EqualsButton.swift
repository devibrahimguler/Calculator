//
//  EqualsButton.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 2.10.2021.
//

import SwiftUI

struct EqualsButton: View {
    
    @Binding var firstNumber : String
    @Binding var nums : [String]

    var calculater = Calculate()
    
    var body: some View {
        Button(action: {
            if self.firstNumber != "" {
                self.nums.append(self.firstNumber)
                
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
        }) {
            Circle()
                .foregroundColor(Color.orange)
                .overlay(
                    Text("=")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                        .padding(.bottom,3)
                
                ).frame(width: UIScreen.main.bounds.width * 0.20, height: 70, alignment: .center)
                .padding(.horizontal,UIScreen.main.bounds.width * 0.01)
        }
    }
}

struct EqualsButton_Previews: PreviewProvider {
    @State static var firstNumber : String = "0"
    @State static var nums : [String] = ["1", "+", "2"]
    static var previews: some View {
        EqualsButton(firstNumber: self.$firstNumber, nums: self.$nums)
    }
}
