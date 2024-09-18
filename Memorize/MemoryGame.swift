//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Mahesh Gupta on 18/09/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for i in 0..<max(2, numberOfPairOfCards){
            let content = cardContentFactory(i)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    func choose(_ card: Card){
        
    }

    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
