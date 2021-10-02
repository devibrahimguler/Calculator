//
//  CalculateButton.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct CalculateButton: View {
    
    @Binding var firstNumber : String
    @Binding var nums : [String]
    
    let iconText: String
    
    var body: some View {
        Button(action: {
            nums.append(self.firstNumber)
            self.firstNumber = "0"
            nums.append(iconText)
        }) {
            Circle()
                .foregroundColor(Color.orange)
                .overlay(
                    Text(iconText)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                        .padding(.bottom,3)
                
                ).frame(width: UIScreen.main.bounds.width * 0.20, height: 70, alignment: .center)
                .padding(.horizontal,UIScreen.main.bounds.width * 0.01)
        }
    }
}

struct CalculateButton_Previews: PreviewProvider {
    @State static var firstNumber : String = "0"
    @State static var nums : [String] = ["1", "+", "2"]
    static var previews: some View {
        CalculateButton(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "+")
    }
}
