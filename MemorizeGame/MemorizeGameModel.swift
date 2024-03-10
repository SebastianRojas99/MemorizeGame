//
//  MemorizeGameModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import Foundation



struct MemoryGame<CardContent> where CardContent:Equatable{
    private(set) var cards:Array<Card>
    
    init(numberOfPairsOfCards:Int,cardContentFactory:(Int)->CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card( content: content, id:"\(pairIndex+1)a"))
            cards.append(Card( content: content, id: "\(pairIndex+1)b"))
            

        }
        
    }
    
    
    mutating func choose(_ card:Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    
    func index(of card:Card) ->Int{
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0//FIXME: bogus
    }
    
    mutating func shuffle(){
        
       cards.shuffle()
        
   }
   
    
    
    
    struct Card:Equatable,Identifiable,CustomDebugStringConvertible{
        
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        var id: String
        var debugDescription: String{
            return "\(id),\(content),\(isFaceUp ? "up":"down"),\(isMatched ? "match" : "not match")"
        }
    }
    
}
