//
//  LoginViewModel.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import SwiftUI
internal import Combine

class LoginViewModel: ObservableObject {
    @Published private(set) var users: [LoginModel] = []
    @Published private(set) var currentUser: LoginModel? = nil
    
    var isAuthenticated: Bool {
        currentUser != nil
    }
    
    var formattedUser: String {
        currentUser?.email ?? "Not logged in"
    }
    
    func register(email:String, password: String) {
        guard !users.contains(where: {
            $0.email == email
        })
        else {
            print("User already exists")
            return
        }
        
        let newUser = LoginModel(email: email, password: password)
        users.append(newUser)
    }
    
    func login(email: String, password: String) {
        guard let user = users.first(where: {
            $0.email == email && $0.password == password
        })
        else {
            print("invalid credentials")
            return
        }
        
        currentUser = user
    }
    
    func logout () {
        currentUser = nil
    }
}

