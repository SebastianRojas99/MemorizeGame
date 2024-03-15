//
//  MemorizeGameViewModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = [["🐍","🐤","🦈","🦅","🐊","🐗","🦫","🐔"],["🛳️","🚅","🚁","🚗","🚜"],["😋","🥲","😚","🥰","🤓"]]
   
    private var currentEmojiIndex = 0
    private static var foo = Int.random(in: 2...6)
    @Published private var emojiMemoryModel: MemoryGame<String>
    
    init() {
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(op: currentEmojiIndex)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return emojiMemoryModel.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        emojiMemoryModel.choose(card)
    }
    
    func getQuantityOfCards()->Int{
        return EmojiMemoryGame.foo
    }
    
    
    
    func changeEmoji() {
        currentEmojiIndex = (currentEmojiIndex + 1) % EmojiMemoryGame.emojis.count
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(op: currentEmojiIndex)
    }
    
    func shuffle() {
        emojiMemoryModel.shuffle()
        
        print(cards)
    }
    
   
    
    private static func createMemoryGame(op: Int) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: foo) { pairIndex in
            let emojis = self.emojis[op]
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }
            return "⁉️"
        }
        
    }
    var currentlyEmojiIndex: Int {
            return self.currentEmojiIndex
        }
     func getCardColor() -> Color {
            switch currentlyEmojiIndex {
            case 0:
                return Color.orange
            case 1:
                return Color.red
            case 2:
                return Color.yellow
            default:
                return Color.white
            }
        }
    
    func titlesColorChanging() ->Color{
        switch currentEmojiIndex{
        case 0:
            return Color.blue
        case 1:
            return Color.green
        case 2:
            return Color.gray
        default:
            return Color.black
        
        }
    }
}
