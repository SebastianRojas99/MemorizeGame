//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var emojiGame:EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {

            ScrollView{
                cards
            }.padding()
    }
    
    var cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)],spacing:0) {
            ForEach(emojiGame.cards.indices,id: \.self){index in
                CardView(emojiGame.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)
                    .padding(4)
            }
        }.padding()
        .foregroundStyle(Color.red)
    }
    
   
    struct CardView:View {
        let card:MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack{
                let base = RoundedRectangle(cornerRadius: 12)
                Group{
                    base.foregroundStyle(Color.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(card.content)
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                    
                }
                .opacity(card.isFaceUp ? 1 : 0)
                base.fill().opacity(card.isFaceUp ?  0 : 1)
            }.onTapGesture {
                
            }
            
        }
    }
}
#Preview {
    EmojiMemoryGameView()
}
