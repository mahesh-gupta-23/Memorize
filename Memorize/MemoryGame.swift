//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Mahesh Gupta on 18/09/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for index in 0 ..< max(2, numberOfPairOfCards){
            let content = cardContentFactory(index)
            cards.append(Card(content: content, id: "\(index)a"))
            cards.append(Card(content: content, id: "\(index)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get {cards.indices.filter{index in cards[index].isFaceUp }.only }
        set {cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0)} }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(of: card) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }

    struct Card : Equatable, Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: String
    }
}

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}
