//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    var emojisArray: Array<String> = ["🐍","🦈","🐊","🦫","🦫"]
    var body: some View {
        HStack {
            ForEach(emojisArray.indices,id: \.self){index in
                CardView(content:emojisArray[index])
                
            }
            
            
            
        }
        .padding()
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
        }.onTapGesture {
            isFaceUp.toggle()
            
        }
    }
}

#Preview {
    ContentView()
}
