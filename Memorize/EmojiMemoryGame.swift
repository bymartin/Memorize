//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Barry Martin on 5/19/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        // MemoryGame<String>(numberOfPairsOfCards: 2) { _  in "😀" }
    
    private static func createMemoryGame() -> MemoryGame<String> {

        var emojiTheme = themes.randomElement()!
        
        emojiTheme.emojiList.shuffle()
        let emojis = emojiTheme.emojiList[0..<5]
        
        return MemoryGame<String>(theme: emojiTheme) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var color: Color {
        return model.theme.color
    }
    
    var themeName: String {
        return model.theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: - Intent(s)
    // things the view can do to change the model
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
