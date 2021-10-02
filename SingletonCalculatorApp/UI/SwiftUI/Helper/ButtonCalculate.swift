//
//  CalculateButton.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonCalculate: View {
    
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

struct ButtonCalculate_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCalculateTests()
    }
    // We want to if clicked button, firstNumber is zero and nums append iconText.
    struct ButtonCalculateTests : View {
        @State var firstNumber : String = "1"
        @State var nums : [String] = []
        
        let elseText : String = "Clear"
        var body: some View {
            VStack {
                Spacer()
                
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "+")
                
                Spacer()
                
                Text("Result: \(self.firstNumber)")
                
                Text("Nums Count: \(self.$nums.count)")

            }
        }
    }
}
