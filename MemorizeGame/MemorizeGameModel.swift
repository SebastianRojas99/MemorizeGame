//
//  MemorizeGameModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import Foundation



struct MemoryGame<CardContent>{
    private(set) var cards:Array<Card>
    
    init(numberOfPairsOfCards:Int,cardContentFactory:(Int)->CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card( content: content))
            cards.append(Card( content: content))

        }
                    
    }
    
    func choose(_ card:Card){
        
    }
    
    func shuffleTheCards(_ card:Card){
        
    }
    
    struct Card{
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
    struct Game{
        var points:Int
    }
}
