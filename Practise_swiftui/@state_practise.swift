//
//  @state_practise.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 16/03/2026.
//

import SwiftUI

struct _state_practise: View {
    
    @State private var quantity = 0
    
    var body: some View {
        VStack {
            Text("Order quantity: \(quantity) ")
           
            HStack {
                Button("Increase"){
                    quantity += 1
                }
                Button("Decrease"){
                    quantity -= 1
                }
            }
               
        }
    }
}

#Preview {
    _state_practise()
}
