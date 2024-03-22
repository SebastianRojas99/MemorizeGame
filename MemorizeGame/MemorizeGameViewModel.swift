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
    
    @Published private var emojiMemoryModel: MemoryGame<String>
    
    
    init() {
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return emojiMemoryModel.cards
    }
    
    
    var score:Int{
        return emojiMemoryModel.score
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        emojiMemoryModel.choose(card)
        
        
    }
    
    func changeTheme() {
        currentEmojiIndex = (currentEmojiIndex + 1) % Theme.allCases.count
        currentTheme = Theme.allCases[currentEmojiIndex]
        emojiMemoryModel = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }

   
    
    
    private static func createMemoryGame(theme:Theme) -> MemoryGame<String> {
        let numberOfPairsOfCards = max(2, min(Int.random(in: 2...(theme.emojis.count / 2)), 11))
        return MemoryGame(numberOfPairsOfCards:numberOfPairsOfCards) { pairIndex in
            let emojis = theme.emojis
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }else{
                return emojis[Int.random(in: 1...emojis.count)]
            }
            
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
        var color:LinearGradient{
            switch self{
            case .green: return .linearGradient(
                colors: [.black,.white, .green,.green],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            case .purple: return .linearGradient(
                colors: [.black,.white, .purple,.purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            case .red: return .linearGradient(
                colors: [.black,.white, .red,.red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            case .yellow: return .linearGradient(
                colors: [.black,.white, .yellow,.yellow],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            case .blue: return .linearGradient(
                colors: [.black,.white, .blue,.blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            case .orange: return .linearGradient(
                colors: [.black,.white, .orange,.orange],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            }
        }
        
    }

}



