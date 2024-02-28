//
//  MemorizeGameViewModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import SwiftUI

class EmojiMemoryGame{
    init(EmojiMemoryModel: MemoryGame<String>) {
        self.EmojiMemoryModel = EmojiMemoryModel
    }
    var EmojiMemoryModel:MemoryGame<String>
}
