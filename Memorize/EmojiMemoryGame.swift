//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mahesh Gupta on 18/09/24.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    private static let emojis = ["😭","🫢","🐶","🐥","🌈","🐚","👻","🎃","👽","🤖"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame<String>(numberOfPairOfCards: 20){ i in
            if(emojis.indices.contains(i)) {
                emojis[i]
            } else {
                "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
