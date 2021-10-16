//
//  NumberButtons.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonNumbers: View {
    
    @Binding var strNumber : String
    @Binding var nums : [String]
    
    let numberText: String
    
    var body: some View {
        Button(action: {
            if self.nums.isEmpty {
                addNumber()
            } else {
                let endItem = self.nums[self.nums.count - 1]
                if endItem == "+" || endItem == "-" || endItem == "x" || endItem == "÷"{
                    self.strNumber = "0"
                    addNumber()
                } else {
                    addNumber()
                }
            }
            
        }) {
            CircleView(iconText: self.numberText, iconColor: .gray, wdh: 0.20, hgt: 70)
        }
    }
    
    func addNumber() {
        if self.strNumber.first == "0" {
            self.strNumber.removeFirst()
        }
        self.strNumber += numberText
    }
    
    
    
}

struct ButtonNumbers_Previews: PreviewProvider {
    @State static var nums1 : [String] = ["5","+","4","-"]
    @State static var nums2 : [String] = ["5","+","4"]
    static var previews: some View {
        Group {
            ButtonNumbersTests(nums: self.$nums1)
            
            ButtonNumbersTests(nums: self.$nums2)
        }
    }
    
    // We want to add strNumber to the right like String. We dont want to add like Integer.
    struct ButtonNumbersTests : View {
        @State var numberText : String = "1"
        @State var strNumber : String = "1"
        @Binding var nums : [String]

        var body: some View {
            VStack {
                Spacer()
                
                ButtonNumbers(strNumber: self.$strNumber, nums: self.$nums, numberText: self.numberText)
                
                Spacer()
                
                Text("End Index: \(self.nums[self.nums.count - 1])")
                Text("Result: \(self.strNumber)")
            }
        }
    }
}
