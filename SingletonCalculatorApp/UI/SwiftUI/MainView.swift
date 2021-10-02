//
//  ContentView.swift
//  SingletonCalculatorApp
//
//  Created by İbrahim Güler on 1.10.2021.
//

import SwiftUI

struct MainView: View {
    
    @State var firstNumber : String = ""
    
    var body: some View {
        VStack{
            
            Spacer()
            
            HStack{
                
                TextField("0", text: self.$firstNumber)
                    .multilineTextAlignment(.trailing)
                    .font(.custom("Arial", fixedSize: 70))
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
            
            ButtonsNumberAndElse(firstNumber: self.$firstNumber)
    
        }.background(Color.black)
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
