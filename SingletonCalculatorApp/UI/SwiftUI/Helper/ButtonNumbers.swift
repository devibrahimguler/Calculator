//
//  NumberButtons.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonNumbers: View {
    @Binding var strNumber : String
    let numberText: String
    
    var body: some View {
        Button(action: {
            if self.strNumber.first == "0" {
                self.strNumber.removeFirst()
            }
            self.strNumber += numberText
        }) {
            Circle()
                .foregroundColor(Color.gray)
                .overlay(
                    Text(numberText)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                ).frame(width: UIScreen.main.bounds.width * 0.20, height: 70, alignment: .center)
                .padding(.horizontal,UIScreen.main.bounds.width * 0.01)
        }
    }
}

struct ButtonNumbers_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNumbersTests()
    }
    
    struct ButtonNumbersTests : View {
        @State var numberText : String = "1"
        @State var strNumber : String = "1"
        let elseText : String = "Clear"
        var body: some View {
            VStack {
                Spacer()
                
                ButtonNumbers(strNumber: self.$strNumber, numberText: self.numberText)
                
                Spacer()
                
                Text("Result: \(self.strNumber)")
            }
        }
    }
}
