//  VIEW
//
//  EmojieMemoryGameView.swift
//
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
//
//        Text("Animals")
//            .font(.largeTitle).padding()
//
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
        
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture{
                viewModel.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.red)
    }
}

//var body: some View {
//       VStack {
//           Button(action: {EmojiMemoryGame.newGame() }) {
//               Text("New Game")
//           }
//           EmojiMemoryGameView(EmojiMemoryGame: EmojiMemoryGame)
//       }
//   }

//struct TitleBar: View{
//    
//}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                
                // in iOS "0 degrees" isn't true norht, it's our 3 oclock
                // in iOS clockwise is opposite
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90),clockwise: true).padding(5).opacity(0.4)
                
                Text(card.content)
            } else {
                if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    
    // MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
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
