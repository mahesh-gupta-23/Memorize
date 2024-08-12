//
//  ContentView.swift
//  Memorize
//
//  Created by Mahesh Gupta on 12/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View{
        if(isFaceUp){
            ZStack(content: {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("Hello, world! 🫡")
                    .multilineTextAlignment(.center)
            })
        }
        else{
            RoundedRectangle(cornerRadius: 12)
        }
    }
}


#Preview {
    ContentView()
}
