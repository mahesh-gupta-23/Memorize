//
//  ContentView.swift
//  Memorize
//
//  Created by Mahesh Gupta on 12/08/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😭","🫢","🐶","🐥","🌈","🐚","👻","🎃","👽","🤖"]
    
    @State var cardCount:Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardAdjuster
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3 , contentMode: .fit)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    
    var cardAdjuster: some View{
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: +1, icon: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, icon: "rectangle.stack.badge.minus.fill")
    }
    
    func cardCountAdjuster(by offset: Int, icon: String) -> some View{
        Button {
            cardCount += offset
        } label: {
            Image(systemName: icon)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
