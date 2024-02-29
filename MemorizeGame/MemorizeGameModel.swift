//
//  MemorizeGameModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import Foundation



struct MemoryGame<CardContent>{
    private(set) var cards:Array<Card>
    
    init(numberOfPairsOfCards:Int) {
        cards = []
        for _ in 0..<numberOfPairsOfCards{
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
        }
                    
    }
    
    func choose(_ card:Card){
        
    }
    
    func shuffleTheCards(_ card:Card){
        
    }
    
    struct Card{
        var isFaceUp:Bool
        var isMatched:Bool
        var content: CardContent
    }
    struct Game{
        var points:Int
    }
}
