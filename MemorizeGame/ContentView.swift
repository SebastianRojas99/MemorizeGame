//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var emojisArray: Array<String> = ["🐍","🦈","🐊","🦫","🦫",]
    @State var cardCount:Int = 4
    var body: some View {
        
        VStack{
            HStack{
                
                
                
                Button(action: {if cardCount >= 2{
                    cardCount -= 1
                }}, label: {
                    Image(systemName: "arrow.backward.to.line.circle.fill")
                }).font(.largeTitle).padding()
                
                Spacer()
                
                Button(action: {
                    if emojisArray.count <= cardCount{
                        cardCount += 0
                    }else{
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                }).font(.largeTitle).padding()
                
            }
            
            HStack {
                ForEach(0..<cardCount,id: \.self){index in
                    CardView(content:emojisArray[index])
                }
            }.padding()
            .foregroundStyle(Color.purple)
            
                
        }
    }
    
    struct CardView:View {
        var content:String
        
        @State var isFaceUp = true
        
        var body: some View {
            ZStack{
                let base = RoundedRectangle(cornerRadius: 12)
                
                if isFaceUp{
                    base.foregroundStyle(Color.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }else{
                    RoundedRectangle(cornerRadius: 12)
                    Text("❔").font(.largeTitle)
                }
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
