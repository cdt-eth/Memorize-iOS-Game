//  VIEWMODEL
//
//  EmojiMemoryGame.swift
//


import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // (set) = "Glass Door"
    // only EmojiMemoryGame can modify model, but everyone can see it
    // the underbar "_" WAS pairIndex, but in Swift it means it doesn't matter. we can put anything here
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["🦔", "🦑", "🦂", "🐢", "🦎", "🦧"]
        let nums = Int.random(in: 2...emojis.count)
//        emojis.count
        
        // insert title bar view here
//        Text("Animals")
//            .font(.largeTitle).padding()
//        HStack {
//            Text("Score: 12")
//                .font(.body).bold().padding(8.0)
//            
//            Button(action: {
//                print("NEW GAME")
//            }) {
//                Text("NEW GAME")
//                    .font(.body).bold().padding(8.0)
//                    .overlay(RoundedRectangle(cornerRadius: 35.0).stroke(lineWidth: 2.0))
//            }
//        }
        
        return MemoryGame<String>(numberOfPairsOfCards: nums) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
//    func newGame() {
//            EmojiMemoryGame.theme = themeData.randomElement()!
//            game = EmojiMemoryGame.createMemoryGame()
//     }
    
    
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        objectWillChange.send()
        model.choose(card: card)
    }
    
}

