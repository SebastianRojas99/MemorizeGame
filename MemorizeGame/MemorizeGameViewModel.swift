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
    
    func changeEmoji() {
        currentEmojiIndex = (currentEmojiIndex + 1) % EmojiMemoryGame.emojis.count
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(op: currentEmojiIndex)
    }
    
    func shuffle() {
        emojiMemoryModel.shuffle()
        print(cards)
    }
    
    private static func createMemoryGame(op: Int) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 3) { pairIndex in
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
}
