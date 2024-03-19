//
//  MemorizeGameViewModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
     var currentTheme:MemoryGame<String>.Theme = .green
    
    private var currentEmojiIndex = 0
    private static var foo = Int.random(in: 2...6)
    @Published private var emojiMemoryModel: MemoryGame<String>
    
    init() {
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(with: currentTheme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return emojiMemoryModel.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        emojiMemoryModel.choose(card)
        
        
    }
    
    func changeTheme() {
        currentEmojiIndex = (currentEmojiIndex + 1) % MemoryGame<String>.Theme.allCases.count
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(with: currentTheme)
    }
    
    func shuffle() {
        emojiMemoryModel.shuffle()
        print(cards)
    }
    
    
    func newGame() {
        let numberOfPairs = Int.random(in: 2...EmojiMemoryGame.foo)
        emojiMemoryModel = MemoryGame(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            let emojis = currentTheme.emojis
            if emojis.indices.contains(pairIndex) {
                
                return emojis[pairIndex]
            }
            return "⁉️"
        }
    }
    
    private static func createMemoryGame(with theme:MemoryGame<String>.Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: foo) { pairIndex in
            let emojis = theme.emojis
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

extension MemoryGame<String>.Theme{
    var color:Color{
        switch self{
        case .green: return Color.green
        case .purple: return Color.purple
        case .red: return Color.red
        }
    }
}
