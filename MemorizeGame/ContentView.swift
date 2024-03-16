//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
  @ObservedObject var emojiGame:EmojiMemoryGame
    
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(Color.primary)
            
        VStack{
            ScrollView{
                cards
                    .animation(.default, value: emojiGame.cards)
            }.padding()
            HStack(spacing:50){
                Button(action:{
                    emojiGame.shuffle()
                    
                }){
                    Image(systemName: "button.programmable").foregroundStyle(Color.black)
                }.scaleEffect(3.5)
                
            }
           
                        
        }
            
    }
    
    var cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: emojiGame.getMinimumWidth()),spacing: 0)],spacing:0) {
            ForEach(emojiGame.cards) {card in
                    CardView(card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .padding(4)
                        .onTapGesture{
                            emojiGame.choose(card)
                        }
            }
        }.padding()
            .foregroundStyle(Color.purple)
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
                        .aspectRatio(1, contentMode: .fit)
                    
                }
                .opacity(card.isFaceUp ? 1 : 0)
                base.fill().opacity(card.isFaceUp ?  0 : 1)
            }
            
        }
    }
}
#Preview {
    EmojiMemoryGameView(emojiGame: EmojiMemoryGame())
}
