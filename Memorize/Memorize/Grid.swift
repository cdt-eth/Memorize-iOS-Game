// GRID
//
//  Grid.swift
//
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
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
    func body(for layout: GridLayout) -> some View{
        ForEach(items) { item in
            body(for: item, in: layout)
        }
    }
    
    // 3) We offer it to our sub-views (.frame(....))
    // 4) We position them at those locations (.position(...))
    func body(for item: Item, in layout: GridLayout) -> some View{
        
        let index = self.index(of: item)
            
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
    func index(of item: Item) -> Int {
        for index in 0..<items.count {
            if items[index].id == item.id {
                return index
            }
        }
        return 0 // TODO: find a better solution
    }
}

