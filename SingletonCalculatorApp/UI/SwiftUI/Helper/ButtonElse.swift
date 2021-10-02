//
//  ElseButtons.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct ButtonElse: View {
    
    @State var action: () -> Void
    
    let elseText: String
    
    var body: some View {
        Button(action: action) {
                RoundedRectangle(cornerRadius: 50)
                .foregroundColor(Color.gray)
                .overlay(
                    Text(elseText)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                        .padding(.bottom,3)
                
                ).frame(width: UIScreen.main.bounds.width * 0.70, height: 70, alignment: .center)
        }
    }
}

struct ButtonElse_Previews: PreviewProvider {
    static var previews: some View {
        ButtonElseTests()
    }
    
    struct ButtonElseTests : View {
        @State var actionInt : Int = 0
        let elseText : String = "Clear"
        var body: some View {
            VStack {
                Spacer()
                
                ButtonElse(action: {
                    self.actionInt += 1
                }, elseText: elseText)
                
                Spacer()
                
                Text("Result: \(self.actionInt)")
            }
        }
    }
}
