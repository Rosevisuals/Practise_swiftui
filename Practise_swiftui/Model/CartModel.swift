//
//  CartModel.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//
import Foundation

struct  CartModel : Identifiable{
    let id = UUID()
    var quantity: Int
    var price: Double
    var name: String
    
}
