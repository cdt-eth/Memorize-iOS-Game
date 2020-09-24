//  VIEWMODEL
//
//  EmojiMemoryGame.swift
//


import SwiftUI

func createCardContent(pairIndex: Int) -> String {
    return "🌹"
}

class EmojiMemoryGame{
    
    // (set) = "Glass Door"
    // only EmojiMemoryGame can modify model, but everyone can see it
    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: createCardContent)
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}

