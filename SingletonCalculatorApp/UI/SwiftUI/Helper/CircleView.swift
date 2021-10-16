//
//  CircleView.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 9.10.2021.
//

import SwiftUI

struct CircleView: View {
    let iconText : String
    let iconColor : Color
    let wdh : Double
    let hgt : Double
    
    var body: some View {
        Circle()
            .foregroundColor(self.iconColor)
            .overlay(
                Text(self.iconText)
                    .foregroundColor(.white)
                    .bold()
                    .font(.title)
                    .padding(.bottom,3)
            
            ).frame(width: UIScreen.main.bounds.width * wdh, height: hgt, alignment: .center)
            .padding(.horizontal,UIScreen.main.bounds.width * 0.01)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(iconText: "=", iconColor: .orange, wdh: 0.20, hgt: 70)
    }
}
