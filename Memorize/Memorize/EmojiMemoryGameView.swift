//  VIEW
//
//  EmojieMemoryGameView.swift
//
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            //            if viewModel.cards.count < 5 {
            //                viewModel.cards.font(Font.body)
            //            } else {
            //                viewModel.cards.font(Font.largeTitle)
            //            }
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {viewModel.choose(card: card)})
            }
        }
        .padding()
        .foregroundColor(Color.red)
        .font(Font.largeTitle)
        //        .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
    }
}


struct CardView: View {
    
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader(content:{ geometry in
            
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
        })
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
