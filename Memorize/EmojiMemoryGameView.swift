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

        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture  {
                    withAnimation(.linear) {
                        self.viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.color)
            //.navigationBarTitle(Text("Memorize! - \(viewModel.themeName)"), displayMode: .inline)
            //.navigationBarItems(trailing:
            //    Button(action:
            //    withAnimation(.easeInOut) { self.viewModel.newGame }) {
            //        Text("New Game")
            //})
            
            HStack {
                Text("Theme: \(viewModel.themeName)")
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.viewModel.newGame()
                    }
                    }) {
                    Text("New Game")
                }
                
                Spacer()
                Text("Score: \(self.viewModel.score)")
                .bold()
            }
            .padding(.leading)
            .padding(.trailing)
            .foregroundColor(self.viewModel.color)
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
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        // iOS drawing, 0.0 is upper left, and increasing down and right
                        // clockwise backwards
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90),
                            clockwise: true)
                            .onAppear {
                                self.startBonusTimeAnimation()
                        }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90),
                        clockwise: true)
                    }
                }
                .padding(5).opacity(0.4)
                
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    // implicit animation
                    .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
                    .animation(card.isMatched ? Animation.linear(duration:0.75).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }

    }
    
    // MARK: - Drawing Constants
    
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
