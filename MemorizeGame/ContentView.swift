//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
     var emojisArray: Array<String> = ["🐍","🐍","🦈","🦈","🐊","🐊","🦫","🦫",]
    @State var emojiGame:EmojiMemoryGame
    
    var body: some View {

            ScrollView{
                cards
            }.padding()
    }
    
    var cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojisArray.indices,id: \.self){index in
                CardView(content:emojisArray[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }.padding()
        .foregroundStyle(Color.red)
    }
    
   
    struct CardView:View {
        var content:String
        @State var isFaceUp = true
        var body: some View {
            ZStack{
                let base = RoundedRectangle(cornerRadius: 12)
                Group{
                    base.foregroundStyle(Color.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ?  0 : 1)
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
}
#Preview {
    ContentView(emojiGame: <#EmojiMemoryGame#>)
}
