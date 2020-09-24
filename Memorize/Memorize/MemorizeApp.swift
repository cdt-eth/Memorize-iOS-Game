//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Christian David Turner on 9/24/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
