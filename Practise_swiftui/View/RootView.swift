//
//  RootView.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//
import Foundation
import SwiftUI

struct RootView: View {
    @EnvironmentObject var auth: LoginViewModel
    
    var body: some View {
        if auth.isAuthenticated {
            HomeView()
        } else {
            LoginView()
        }
    }
}
