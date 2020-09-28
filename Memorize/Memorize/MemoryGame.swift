//  MODEL
//
//  MemoryGame.swift
//
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{

    // private set meants WRITING is private but reading is not
    private(set) var cards: Array<Card>
    
    // optionals are automatically initialized to nil
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        
        get {
            // var faceUpCardIndices = cards.indices.filter { index in cards[index].isFaceUp }
            // $0 means "first argument", $1 means "second arguement" and so on
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                    cards[index].isFaceUp = index == newValue
            }
        }
        
    }
    
    
    
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        
        // the comma here is the same as &&, it's called "sequential and" for "let's"
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            cards.shuffle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
