//
//  MemorizeGameViewModel.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 28/02/2024.
//
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    var currentTheme:Theme = .green
    
    private var currentEmojiIndex = 0
    private static var foo = Int.random(in: 2...6)
    @Published private var emojiMemoryModel: MemoryGame<String>
    
    init() {
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return emojiMemoryModel.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        emojiMemoryModel.choose(card)
        
        
    }
    
    func changeTheme() {
        currentEmojiIndex = (currentEmojiIndex + 1) % Theme.allCases.count
        currentTheme = Theme.allCases[currentEmojiIndex]
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }

    
    func shuffle() {
        emojiMemoryModel.shuffle()
        print(cards)
    }
    
    
    private static func createMemoryGame(theme:Theme) -> MemoryGame<String> {
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
    enum Theme {
        case green
        case purple
        case red
        case yellow
        case blue
        case orange
        
        static var allCases: [Theme] {
            return [.green, .purple, .red, .yellow, .blue, .orange]
        }
        
        var title: String {
            switch self {
            case .green: return "Green Memorize"
            case .purple: return "Purple Memorize"
            case .red: return "Red Memorize"
            case .yellow: return "Yellow Memorize"
            case .blue: return "Blue Memorize"
            case .orange: return "Orange Memorize"
            }
        }
        
        var emojis: [String] {
            switch self {
            case .green:
                return ["🌳", "🍏", "🥦", "🦠", "🐢", "🦜", "🍀", "🥑", "🍐", "🦖"]
            case .purple:
                return ["🍇", "🔮", "💜", "🍆", "🌌", "🦄", "👾", "🍇", "🎆", "👚"]
            case .red:
                return ["🍎", "🌹", "🍓", "🚗", "🎈", "🔥", "❤️", "🦀", "🍒", "🍄"]
            case .yellow:
                return ["🌻", "⭐", "🐥", "🍋", "🌟", "🌞", "🏵️", "📒", "🧀", "🟡"]
            case .blue:
                return ["💧", "📘", "🐳", "🌀", "🦋", "🌊", "🔵", "🌏", "🔷", "🦕"]
            case .orange:
                return ["🍊", "🎃", "🔥", "🌅", "🦊", "📙", "🧡", "🍑", "🥕", "🦁"]
            }
        }
        var color:Color{
            switch self{
            case .green: return Color.green
            case .purple: return Color.purple
            case .red: return Color.red
            case .yellow: return Color.yellow
            case .blue: return Color.blue
            case .orange: return Color.orange
            }
        }
    }

}


