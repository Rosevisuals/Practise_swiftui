//
//  FoodItem.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var isFavorite: Bool
    var quantity: Int
}
