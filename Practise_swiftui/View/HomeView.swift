//
//  HomeView.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: LoginViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome")
                .font(.largeTitle)
            
            Text(auth.formattedUser)
                .foregroundColor(.gray)
            
            Button("Logout") {
                auth.logout()
            }
        }
    }
}
