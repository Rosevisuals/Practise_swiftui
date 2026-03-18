//
//  likebutton.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 16/03/2026.
//

import SwiftUI

struct likebutton: View {
    
    @State private var like = 0
    @State private var isLiked = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Chop now")
            Button (action: {
                isLiked.toggle()
                like += isLiked ? 1 : max(like - 1, 0)
            }){
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.default)
                    .foregroundColor(isLiked ? .red : .green)
            }
            Text("Number of likes \(like)")
        }
    }
}

#Preview {
    likebutton()
}
/// Button("increase){like += 1}


