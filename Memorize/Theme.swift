//
//  Theme.swift
//  Memorize
//
//  Created by Barry Martin on 6/1/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import Foundation
import SwiftUI

struct Theme: Codable {
    let name: String
    var emojiList: [String]
    var numberOfPairsOfCardsToShow: Int
    let colorRGB: UIColor.RGB
    
    var color: Color {
        Color(colorRGB)
    }
    
    var json: Data?  {
        try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?) {
        if json != nil, let newTheme = try? JSONDecoder().decode(Theme.self, from: json!) {
            self = newTheme
        } else {
            return nil
        }
    }
    
    init(name: String, emojiList: [String], numberOfPairsOfCardsToShow: Int, colorRGB: UIColor.RGB) {
        self.name = name
        self.emojiList = emojiList
        self.numberOfPairsOfCardsToShow = numberOfPairsOfCardsToShow
        self.colorRGB = colorRGB
    }
}

let themes = [halloween, gaming, animals, christmas, food, vehicles, faces]

let halloween = Theme(name: "Halloween", emojiList: ["👻","🎃","🕷","👺","🍬","🍭","💀","🧠","👁"],
                      numberOfPairsOfCardsToShow: 5, colorRGB: UIColor.orange.rgb)

let gaming = Theme(name: "Gaming", emojiList: ["🎮","🕹","🎳","🎰","👾","🎲","🤖","🏈","🏓","🖥","💻"],
                   numberOfPairsOfCardsToShow: 5, colorRGB: UIColor.blue.rgb)

let animals = Theme(name: "Animals", emojiList: ["🐶","🐱","🐭","🐹","🐰","🦊","🐼","🐨","🐯","🦁","🐮","🐸","🐵","🐤"],
                    numberOfPairsOfCardsToShow: 5, colorRGB: UIColor.yellow.rgb)

let christmas = Theme(name: "Christmas", emojiList: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁"],
                      numberOfPairsOfCardsToShow: 5, colorRGB: UIColor.red.rgb)

let food = Theme(name: "Food", emojiList: ["🍏","🍐","🍊","🍌","🍋","🍉","🍇","🍓","🍒","🥦","🥕","🧀","🥞","🥩","🍔","🍕"],
                 numberOfPairsOfCardsToShow: 5, colorRGB: UIColor.purple.rgb)

let vehicles = Theme(name: "Vehicles", emojiList: ["🚗","🚎","🏎","🚓","🚑","🚒","🚜","🚂","✈️","🚀","🛸","🚁","⛵️","🛳","🛶"],
                     numberOfPairsOfCardsToShow: 5, colorRGB: UIColor.magenta.rgb)

let faces = Theme(name: "Faces", emojiList: ["😀","😅","🤣","😇","😉","😍","😘","😝","🤪","😎","😡","😳","🥶","🤢",],
                  numberOfPairsOfCardsToShow: 5, colorRGB: UIColor.green.rgb)


