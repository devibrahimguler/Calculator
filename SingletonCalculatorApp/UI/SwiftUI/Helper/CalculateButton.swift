//
//  CalculateButton.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct CalculateButton: View {
    
    @State var action: () -> Void
    
    let iconText: String
    
    var body: some View {
        Button(action: action) {
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
    static var previews: some View {
        CalculateButton(action: {}, iconText: "+")
    }
}
