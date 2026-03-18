//
//  Ordering.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 18/03/2026.
//

import SwiftUI
//with identifiable swiftui is watching it
struct Ordering: Identifiable {
   let id = UUID()
    var name: String
    var price: Double
    var fav: Bool
    var quantity: Int
}

struct FoodListView: View {
    @State private var food = [
            Ordering(name: "Pizza House", price: 230.34,
                 fav: false, quantity: 5),
      Ordering(name: "Burger Palace", price: 200.34,
                 fav: false, quantity: 3),
        Ordering(name: "Fries on wheels", price: 130.34,
                 fav: false, quantity: 5)
    ]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach($food){
                    $item in FoodCardView (food : $item)
                }
            }
        }
      
    }
}

struct FoodCardView: View {
    @Binding var food : Ordering
    
    var body: some View {
        VStack {
            Text (food.name)
            .padding()
            Text ("\(food.price)")
                .padding()
            Button (action: {
                food.fav.toggle()
            }){
                Image(systemName: food.fav ? "heart.fill" : "heart")
                    .foregroundStyle(food.fav ? .red : .green)
            }
            .padding()
            NavigationLink {
                FoodDetailView (food: $food)
            } label : {
                Text("Edit")
            }
            Text("\(food.quantity)")
        }
    }
}

struct FoodDetailView: View {
    @Binding var food: Ordering
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text (food.name)
            Text ("\(food.price)")
            HStack{
                Button ("increase"){
                    food.quantity += 1
                }
                Button ("decrease"){
                    food.quantity = max(food.quantity - 1, 0)
                }
            }
            Button (action: {
//                like += isLiked ? 1 : max(like - 1, 0)
                food.fav.toggle()
            }) {
                Image(systemName: food.fav ? "heart.fill" : "heart")
                    .foregroundStyle(food.fav ? .red : .green)
            }
            Text("\(food.quantity)")
        }
    }
}

#Preview {
    FoodListView()
}
