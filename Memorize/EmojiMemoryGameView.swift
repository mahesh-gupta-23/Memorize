//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Mahesh Gupta on 12/08/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio : CGFloat = 2/3
    
    var body: some View {
        VStack{
            cards
                .animation(.default, value: viewModel.cards)
        }
        .padding()
        Button("Shuffle") {
            viewModel.shuffle()
        }
    }
    
    private var cards: some View{
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isMatched ? 0 : 1)
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
