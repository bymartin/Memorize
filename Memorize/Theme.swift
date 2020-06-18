//
//  Theme.swift
//  Memorize
//
//  Created by Barry Martin on 6/1/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import Foundation
import SwiftUI

struct Theme {
    let name: String
    var emojiList: [String]
    var numberOfPairsOfCardsToShow: Int
    let color: Color
}

let themes = [halloween, gaming, animals, christmas, food, vehicles, faces]

let halloween = Theme(name: "Halloween", emojiList: ["👻","🎃","🕷","👺","🍬","🍭","💀","🧠","👁"],
                      numberOfPairsOfCardsToShow: 5, color: .orange)

let gaming = Theme(name: "Gaming", emojiList: ["🎮","🕹","🎳","🎰","👾","🎲","🤖","🏈","🏓","🖥","💻"],
                   numberOfPairsOfCardsToShow: 5, color: .blue)

let animals = Theme(name: "Animals", emojiList: ["🐶","🐱","🐭","🐹","🐰","🦊","🐼","🐨","🐯","🦁","🐮","🐸","🐵","🐤"],
                    numberOfPairsOfCardsToShow: 5, color: .yellow)

let christmas = Theme(name: "Christmas", emojiList: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁"],
                      numberOfPairsOfCardsToShow: 5, color: .red)

let food = Theme(name: "Food", emojiList: ["🍏","🍐","🍊","🍌","🍋","🍉","🍇","🍓","🍒","🥦","🥕","🧀","🥞","🥩","🍔","🍕"],
                 numberOfPairsOfCardsToShow: 5, color: .purple)

let vehicles = Theme(name: "Vehicles", emojiList: ["🚗","🚎","🏎","🚓","🚑","🚒","🚜","🚂","✈️","🚀","🛸","🚁","⛵️","🛳","🛶"],
                     numberOfPairsOfCardsToShow: 5, color: .pink)

let faces = Theme(name: "Faces", emojiList: ["😀","😅","🤣","😇","😉","😍","😘","😝","🤪","😎","😡","😳","🥶","🤢",],
                  numberOfPairsOfCardsToShow: 5, color: .green)


