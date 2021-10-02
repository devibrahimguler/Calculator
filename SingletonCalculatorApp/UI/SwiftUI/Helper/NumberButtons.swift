//
//  NumberButtons.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct NumberButtons: View {
    
    @State var action: () -> Void
    
    let numberText: String
    
    var body: some View {
        Button(action: action) {
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

struct NumberButtons_Previews: PreviewProvider {
    static var previews: some View {
        NumberButtons(action: {}, numberText: "1")
    }
}
