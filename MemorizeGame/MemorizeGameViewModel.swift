//
//  MemorizeGameViewModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import SwiftUI

class EmojiMemoryGame{
        
   private var EmojiMemoryModel:MemoryGame<String> = MemoryGame(numberOfPairsOfCards: 4)
    
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
