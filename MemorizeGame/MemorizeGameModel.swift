//
//  MemorizeGameModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import Foundation



struct MemoryGame<CardContent>{ //tipo generico, recibe cualquier tipo
    private(set) var cards:Array<Card> // al ser private set se modifica solo dentro del scope de memory game
    
    init(numberOfPairsOfCards:Int,cardContentFactory:(Int)->CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card( content: content))
            cards.append(Card( content: content))
            

        }
        
    }
    
    
    func choose(_ card:Card){
        
    }
    
    mutating func shuffle(){
        
       cards.shuffle()
        
   }
    
    
    
    struct Card{
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
    
}
