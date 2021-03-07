//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kirill Denisov on 12.01.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👺", "🤡", "🤬", "🥵", "👹"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2..<6)) {pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: -Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
