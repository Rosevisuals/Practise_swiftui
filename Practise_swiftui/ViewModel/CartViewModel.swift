//
//  CartViewModel.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import SwiftUI

internal import Combine

class CartViewModel: ObservableObject {
    /// used for properties whose changes automatically notfiy the UI
    @Published var items: [CartModel] = []
    
//    whhy not @Published
    /// because totalPrice is a computed property its calculated each time an item is added to the cart
    var totalPrice: Double {
        items.reduce(0) { $0 + (Double($1.quantity) * $1.price) }
    }
    
    func fetchItems() {
        self.items = [
            CartModel(quantity: 5, price: 239.99, name: "Pizza Palace"),
            CartModel(quantity: 25, price: 39.99, name: "BurgerPalace"),
            CartModel(quantity: 2, price: 439.99, name: "Pizza Palace"),
        ]
    }
//    Index is used to know the position of the item in an array
/// the firstIndex(where: ) searches the items array whose name matches the item am working with
    /// its returns index(position) of the matching item
    /// #item.name can lead to the app to break why because items can have the same names like in my code so instead of name we use id to identify the items in the model
    func addToCart(item: CartModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            /// position of the found item in the array
            items[index].quantity += item.quantity
        } else {
            /// it adds the new items since its not already in the cart (adds a new cart item)
            items.append(item)
        }
    }
    
    func removeFromCart(name: String) {
        items.removeAll { $0.name == name }
    }
    func decrement(item: CartModel) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        
        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }
    }
    func updateQuantity(for name: String, quantity: Int) {
        if let index = items.firstIndex(where: { $0.name == name }) {
            if quantity > 0 {
                items[index].quantity = quantity
            } else {
                // If quantity is 0 or less, remove the item
                items.remove(at: index)
            }
        }
    }
}
