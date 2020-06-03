//
//  MemoryGame.swift
//  Memorize
//
//  Created by Barry Martin on 5/19/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    var theme: Theme
    var score = 0
    var seenCards = Set<Int>()
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            // turns all the other cards face down
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    // mismatch case
                    if seenCards.contains(cards[chosenIndex].id) {
                        score -= 1
                    }
                    if seenCards.contains(cards[potentialMatchIndex].id) {
                        score -= 1
                    }
                    seenCards.insert(cards[chosenIndex].id)
                    seenCards.insert(cards[potentialMatchIndex].id)
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                // thare are 0 or more than 1 face up cards
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(theme: Theme, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        let numberOfPairsOfCards = theme.numberOfPairsOfCardsToShow ?? Int.random(in: 2...5)
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
        self.theme = theme
        
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
