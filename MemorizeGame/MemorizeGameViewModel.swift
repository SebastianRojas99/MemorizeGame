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
    
    func changeEmoji() {
        currentEmojiIndex = (currentEmojiIndex + 1) % EmojiMemoryGame.emojis.count
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(op: currentEmojiIndex)
    }
    
    func shuffle() {
        emojiMemoryModel.shuffle()
        print(cards)
    }
    
    
    func newGame() {
        let numberOfPairs = Int.random(in: 2...EmojiMemoryGame.foo)
        emojiMemoryModel = MemoryGame(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            let emojis = EmojiMemoryGame.emojis[currentEmojiIndex]
            if emojis.indices.contains(pairIndex) {
                
                return emojis[pairIndex]
            }
            return "⁉️"
        }
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
    
    func getMinimumWidth() -> CGFloat {
        switch EmojiMemoryGame.foo {
        case 2:
            return 120
        case 3...4:
            return 100
        case 5...8:
            return 80
        case 9...16:
            return 60
        default:
            return 40
        }
    }
}
