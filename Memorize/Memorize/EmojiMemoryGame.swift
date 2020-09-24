//  VIEWMODEL
//
//  EmojiMemoryGame.swift
//


import SwiftUI

class EmojiMemoryGame{
    
    // (set) = "Glass Door"
    // only EmojiMemoryGame can modify model, but everyone can see it
    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: {(pairIndex: Int) -> String in
        return "🌹"
    })
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}

