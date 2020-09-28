// GRID
//
//  Grid.swift
//
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    // 1) We get the space that's offered to us
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    // 2) We use this GridLayout to divide it up
    private func body(for layout: GridLayout) -> some View{
        ForEach(items) { item in
            body(for: item, in: layout)
        }
    }
    
    // 3) We offer it to our sub-views (.frame(....))
    // 4) We position them at those locations (.position(...))
    private func body(for item: Item, in layout: GridLayout) -> some View {
        
        let index = items.firstIndex(matching: item)!
        
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}
