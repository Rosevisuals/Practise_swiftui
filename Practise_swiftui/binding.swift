//
//  binding.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 17/03/2026.
//

import SwiftUI

struct binding: View {
    @State private var username = " "
    @State private var email = " "
    
    var body: some View {
        VStack (spacing: 20) {
            Text (" Username ")
            UserInput (username: $username)
                .padding()
            
            Text("Email")
            EmailInput (email: $email)
        }
        .padding()
    }
    
}

struct UserInput: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Enter your username", text: $username)
            .textFieldStyle(.roundedBorder)
    }
}
struct EmailInput: View {
    @Binding var email: String
    
    var body: some View {
        TextField("Enter your email", text: $email)
            .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    binding()
}
