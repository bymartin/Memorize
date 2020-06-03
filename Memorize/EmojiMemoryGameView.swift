//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Barry Martin on 5/19/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            VStack {
                Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture  {
                        self.viewModel.choose(card: card)
                    }
                    .padding(5)
                }
                .padding()
                .foregroundColor(viewModel.color)
                .navigationBarTitle(Text("Memorize! - \(viewModel.themeName)"), displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: self.viewModel.newGame) {
                        Text("New Game")
                })
                
                Text("Score: \(self.viewModel.score)")
                    .bold()
                    .foregroundColor(self.viewModel.color)
            }
        }
        
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                // iOS drawing, 0.0 is upper left, and increasing down and right
                // clockwise backwards
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90),
                    clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
            //.aspectRatio(2/3, contentMode: .fit)
            .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
