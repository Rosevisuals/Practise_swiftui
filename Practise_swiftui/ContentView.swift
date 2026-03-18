//
//  ContentView.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 20/02/2026.
//

import SwiftUI
struct Episode {
    let title: String
    let showTitle: String
}
struct ContentView: View {
    var episode: Episode = Episode(title: "Hello from the other side", showTitle: "At least i couldn't understand")
    @State private var isPlaying: Bool = false
    var body: some View {
        Button (action: {
            self.isPlaying.toggle()
            
        }){
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}

#Preview {
    ContentView()
}
