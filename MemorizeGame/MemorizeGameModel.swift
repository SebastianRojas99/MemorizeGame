//
//  MemorizeGameModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    private(set) var cards:Array<Card>
    var startTime: Date
    var score:Int
    
    var indexOfCard:Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue==$0) } }
    }
    
    init(numberOfPairsOfCards:Int, cardContentFactory:(Int)->CardContent) {
        score = 0
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content, id:"\(pairIndex+1)a"))
            cards.append(Card( content: content, id: "\(pairIndex+1)b"))
            cards.shuffle()
        }
        startTime = Date()
    }
    
    mutating func choose(_ card:Card) {
        if let chosenIndex = cards.firstIndex( where:{$0.id == card.id}), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            let currentTime = Date()
            let timeInterval = currentTime.timeIntervalSince(startTime)
            if let potentialMatchedIndex = indexOfCard {
                if cards[chosenIndex].content == cards[potentialMatchedIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                    if timeInterval < 20 {
                        score += 200 - Int(timeInterval) * 20
                    }
                } else {
                    score -= 100
                }
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
            }
            cards[chosenIndex].isFaceUp = true
            startTime = Date()
        }
    }
    
    struct Card:Equatable,Identifiable,CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var id: String
        var debugDescription: String {
            "\(id):\(content) \(isFaceUp ? "up":"down") \(isMatched ? "match" : "")"
        }
    }
    
    struct Theme:Equatable {
    }
}

extension Array {
    var only:Element? {
        count == 1 ? first : nil
    }
}
