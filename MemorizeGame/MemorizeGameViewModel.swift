//
//  MemorizeGameViewModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import SwiftUI



class EmojiMemoryGame:ObservableObject{
   private static let emojis = ["🐍","🐤","🦈","🦅","🐊","🐗","🦫","🐔"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 3) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }
            return "⁉️"
         }
    }
   
    @Published private var EmojiMemoryModel = createMemoryGame()
    
    
    var cards:Array<MemoryGame<String>.Card>{
        return EmojiMemoryModel.cards 
    }
    
    func choose(_ card:MemoryGame<String>.Card){
        EmojiMemoryModel.choose(card)
    }
    
    func shuffle(){
        EmojiMemoryModel.shuffle()
    }
    
    
}
