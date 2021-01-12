//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kirill Denisov on 12.01.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    var body: some Scene {
        let game = EmojiMemoryGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
