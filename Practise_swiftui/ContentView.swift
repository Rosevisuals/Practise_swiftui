//
//  ContentView.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 20/02/2026.
//

import SwiftUI

struct TextView: View {
    let text: String
    let color: Color
    
    var body: some View {
        
                Image (systemName: "balloon")
            .foregroundStyle(color)
                Text(text)
                    .foregroundStyle(color)
                    .padding()
                    .background(.black .opacity(0.8))
                    .font(.largeTitle)
                    
      
        }
    }


#Preview {
    VStack{
        TextView (text: "Hello", color: .blue)
        TextView (text: "My", color: .green)
        TextView (text: "World", color: .red)
        TextView (text: "hmmmmm", color: .white)
    }
}
