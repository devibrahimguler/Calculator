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
    @State static var nums : [String] = ["4", "+", "2"]
    static var previews: some View {
        CalculateButtonTests(nums: self.$nums)
    }
    
    struct CalculateButtonTests : View {
        @State var firstNumber : String = "1"
        @Binding var nums : [String]
        
        let elseText : String = "Clear"
        var body: some View {
            VStack {
                Spacer()
                
                CalculateButton(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "+")
                
                Spacer()
                
                Text("Result: \(self.firstNumber)")
                
                ForEach(nums, id: \.self) { num in
                    Text("Nums: \(num)")
                }
            }
        }
    }
}
