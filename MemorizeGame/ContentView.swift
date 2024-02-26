//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Sebastian Marquez Rojas on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundStyle(Color.orange)
    }
}

struct CardView:View {
    var isFaceUp:Bool = false
    var body: some View {
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.white)
                
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🦫").font(.largeTitle)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }else{
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

#Preview {
    ContentView()
}
