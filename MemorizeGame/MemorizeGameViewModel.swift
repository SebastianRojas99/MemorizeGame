//
//  MemorizeGameViewModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import SwiftUI



class EmojiMemoryGame{
   private static let emojis = ["🐍","🐍","🦈","🦈","🐊","🐊","🦫","🦫"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
         }
    }
   
    private var EmojiMemoryModel = createMemoryGame()
    
    var cards:Array<MemoryGame<String>.Card>{
        return EmojiMemoryModel.cards
    }
    
    func choose(_ card:MemoryGame<String>.Card){
        EmojiMemoryModel.choose(card)
    }
    
    func shuffleTheCards(_ card:MemoryGame<String>.Card){
        EmojiMemoryModel.shuffleTheCards(card)
    }
    
}
