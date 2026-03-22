//
//  AuthViewModel.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 22/03/2026.
//


import SwiftUI

internal import Combine

class AuthViewModel: ObservableObject {
    
    @Published  var currentUser: AuthModel? = nil
    
    var isLoggedIn: Bool {
        currentUser = nil
    }
    
    func login(email: String, password: String , username: String) {
        let user = AuthModel(email: email, username: username, password:password)
        currentUser = user
    }
    func logout() {
        currentUser = nil
    }
    
}
