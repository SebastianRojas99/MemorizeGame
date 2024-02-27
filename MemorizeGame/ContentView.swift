//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var emojisArray: Array<String> = ["🐍","🐍","🦈","🦈","🐊","🐊","🦫","🦫",]
    @State var cardCount:Int = 4
    var body: some View {
        
        VStack{
            cardsCountHelpers
            Spacer()
            ScrollView{
                cards
            }
            
        }
    }
    
    var cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount,id: \.self){index in
                CardView(content:emojisArray[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }.padding()
        .foregroundStyle(Color.purple)
    }
    
    var cardsCountHelpers:some View{
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
    }
    
    func cardCountHelper(by offset:Int,symbol:String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .font(.largeTitle).padding()
        .disabled(cardCount + offset < 1 || cardCount + offset > emojisArray.count )
    }
    
    var cardAdder:some View{
        return cardCountHelper(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover:some View{
        return cardCountHelper(by: -1, symbol: "rectangle.stack.badge.minus.fill")
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
    ContentView()
}
