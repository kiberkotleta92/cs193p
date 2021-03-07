//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kirill Denisov on 12.01.2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var numberOfPairsOfCards: Int
    
    var indexOfTheFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].FaceUp }.only }
        set{
            for index in cards.indices{
                cards[index].FaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenCard = cards.firstIndex(matching: card), !cards[chosenCard].FaceUp, !cards[chosenCard].isMatched {
            
            if let potentialMatchIndex = indexOfTheFaceUpCard {
                if cards[chosenCard].content == cards[potentialMatchIndex].content{
                    cards[chosenCard].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenCard].FaceUp = true

            } else {
                indexOfTheFaceUpCard = chosenCard
            }
            
        }
    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        self.numberOfPairsOfCards = numberOfPairsOfCards
        for pairIndex in 0..<self.numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var FaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
