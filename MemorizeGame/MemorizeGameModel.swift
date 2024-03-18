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
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content, id:"\(pairIndex+1)a"))
            cards.append(Card( content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    
    mutating func choose(_ card:Card){
    if let chosenIndex = cards.firstIndex( where:{$0.id == card.id}) {
            
        
        cards[chosenIndex].isFaceUp.toggle()
            
        }
    }
    
   
    func match(_ card:Card){
        
    }
    
    
    
    
    mutating func shuffle() {
        
        for index in cards.indices {
                cards[index].isFaceUp = false
            }
        cards.shuffle()
    
        
   }
    struct Card:Equatable,Identifiable,CustomDebugStringConvertible{
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var id: String
        var debugDescription: String{
            "\(id):\(content) \(isFaceUp ? "up":"down") \(isMatched ? "match" : "")"
        }
    }
}
