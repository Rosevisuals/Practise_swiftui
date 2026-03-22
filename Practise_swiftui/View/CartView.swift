//
//  CartView.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text("$\(item.price, specifier: "%.2f") x \(item.quantity)")
                                .font(.subheadline)
                        }
                        Spacer()
                        HStack(spacing: 8) {
                            Button(action: {
                                viewModel.updateQuantity(for: item.name, quantity: item.quantity - 1)
                            }) {
                                Image(systemName: "minus.circle")
                            }
                            Text("\(item.quantity)").frame(minWidth: 24)
                            Button(action: {
                                viewModel.updateQuantity(for: item.name, quantity: item.quantity + 1)
                            }) {
                                Image(systemName: "plus.circle")
                            }
                        }
                        Button(action: {
                            viewModel.removeFromCart(name: item.name)
                        }) {
                            Image(systemName: "trash").foregroundColor(.red)
                        }
                    }
                }
            }
            HStack {
                Text("Total Price:")
                    .font(.headline)
                Spacer()
                Text("$\(viewModel.totalPrice, specifier: "%.2f")")
                    .font(.title2).bold()
            }
            .padding()
            Button("Add Sample Item") {
                viewModel.addToCart(item: CartModel(quantity: 1, price: 99.99, name: "Sample Food"))
            }
            .padding(.bottom)
        }
//        the view disappears - reappears - fetch runs again
        .onAppear { viewModel.fetchItems() }
    }
}

#Preview {
    CartView()
}
