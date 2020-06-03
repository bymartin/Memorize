//
//  Grid.swift
//  Memorize
//
//  Created by Barry Martin on 5/28/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
        
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
            return viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index))
    }
    
}




//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}

//Grid(viewModel.cards) { card in
//        CardView(card: card).onTapGesture  {
//                self.viewModel.choose(card: card)
//        }
//}
