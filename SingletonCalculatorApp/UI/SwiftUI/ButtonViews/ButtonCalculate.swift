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
    var color : Color
    
    var body: some View {
        Button(action: {
            nums.append(self.firstNumber)
            nums.append(iconText)
        }) {
            CircleView(iconText: self.iconText, iconColor: self.color, wdh: 0.20, hgt: 70)
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
        var color : Color = Color.orange
        
        let elseText : String = "Clear"
        var body: some View {
            VStack {
                Spacer()
                
                ButtonCalculate(firstNumber: self.$firstNumber, nums: self.$nums, iconText: "+", color: self.color)
                
                Spacer()
                
                Text("Result: \(self.firstNumber)")
                
                Text("Nums Count: \(self.$nums.count)")

            }
        }
    }
}
