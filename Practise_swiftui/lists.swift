//
//  lists.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 17/03/2026.
//

import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    var name: String
    var fav: Bool
}

struct RestaurantListView: View {
    @State private var restaurants =
    [
        Restaurant(name: "Burger house", fav: false),
        Restaurant(name: "Pizza House", fav: false)
    ]
    
    var body: some View {
        VStack {
            ForEach ($restaurants) {
                $restaurants in RestaurantCardView(restaurants : $restaurants)
            }
        }
    }
}

struct RestaurantCardView: View {
    @Binding var restaurants: Restaurant
    
    var body: some View {
        HStack {
            Text(restaurants.name)
                .padding()
            Button {
                restaurants.fav.toggle()
            }
            label: {
                Image(systemName: restaurants.fav ? "heart.filled" : "heart")
                    .foregroundColor(restaurants.fav ? .red : .green)
            }
        }
        .padding()
    }
}

#Preview {
   RestaurantListView()
}
