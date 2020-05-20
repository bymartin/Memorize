//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Barry Martin on 5/19/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        // MemoryGame<String>(numberOfPairsOfCards: 2) { _  in "😀" }
    
    static func createMemoryGame() -> MemoryGame<String> {
        // Have the emoji on the cards be randomly chosen from a larger set so
        // that each game won't always use the same 5 emoji
        var emojiList = ["👻","🎃","🕷","👺","🍬","🍭","😈","💩","👽","🤡","☠️","💀","🧠","👁"]
        // shuffle the array and then use the first 5 emoji for the game
        emojiList.shuffle()
        let emojis = emojiList[0..<5]
        // let emojis = ["👻","🎃","🕷","👺","🍬"]
        let randomNumberOfPairs = Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    // things the view can do to change the model
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
