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
            Text("Animals")
                .font(.largeTitle).padding()
            Text("Score: 12")
                .font(.body).bold().padding(8.0)
        }
        
        VStack{
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(Color.red)
            
            // New Game button
            Button(action: { viewModel.resetGame()
            }, label: { Text("NEW GAME").font(.body).bold().padding(8.0)
                .overlay(RoundedRectangle(cornerRadius: 35.0).stroke(lineWidth: 2.0))
            })
            
        }
    }
}


struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        
        if card.isFaceUp || !card.isMatched{
            ZStack {
                // in iOS "0 degrees" isn't true north, it's our 3 oclock
                // in iOS clockwise is opposite
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true).padding(5).opacity(0.4)
                
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 :0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp:card.isFaceUp)
        }
    }
    
    
    // MARK: - Drawing Constants
    
    
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
