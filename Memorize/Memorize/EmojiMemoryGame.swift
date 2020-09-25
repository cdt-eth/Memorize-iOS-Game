//  VIEWMODEL
//
//  EmojiMemoryGame.swift
//


import SwiftUI

class EmojiMemoryGame{
    
    // (set) = "Glass Door"
    // only EmojiMemoryGame can modify model, but everyone can see it
//     the underbar "_" WAS pairIndex, but in Swift it means it doesn't matter. we can put anything here
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["🦔", "🦑", "🦂", "🐢", "🦎", "🦧"]
        let nums = Int.random(in: 2...emojis.count)
//        emojis.count
        return MemoryGame<String>(numberOfPairsOfCards: nums) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}

