//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var emojiGame: EmojiMemoryGame

  var body: some View {
    VStack {
      Text(emojiGame.currentTheme.title)
        .font(.largeTitle)
        .bold()
        .foregroundColor(Color.primary)
        .padding()
      Text("\(emojiGame.score)").font(.headline)

      ScrollView {
        cards
          .padding()
          .animation(.easeIn(duration: 0.3), value: emojiGame.cards) 
      }

      HStack(spacing: 50) {
        Button(action: {
          emojiGame.changeTheme()
        }) {
          Image(systemName: "capsule.inset.filled").foregroundStyle(Color.black)
          Text("New Game!")
            .font(.title3)
            .foregroundColor(Color.black)
            .padding()
        }
      }
    }
  }

  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)], spacing: 0) {
      ForEach(emojiGame.cards.reversed()) { card in
        CardView(card: card)
          .aspectRatio(2/3, contentMode: .fit)
          .padding(4)
          .onTapGesture {
            emojiGame.choose(card)
          }
      }
    }
    .padding()
    .foregroundStyle(emojiGame.currentTheme.color)
  }

  struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(Color.white)
          .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2))
          .opacity(card.isFaceUp ? 1 : 0)

        RoundedRectangle(cornerRadius: 12)
          .fill()
          .opacity(card.isFaceUp ? 0 : 1)

        Text(card.content)
          .font(.system(size: 80))
          .minimumScaleFactor(0.01)
          .aspectRatio(contentMode: .fit)
          .padding(24)
          .foregroundColor(.blue)
          .opacity(card.isFaceUp ? 1 : 0)
      }
      .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
  }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiMemoryGameView(emojiGame: EmojiMemoryGame())
  }
}
