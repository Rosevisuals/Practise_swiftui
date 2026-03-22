//
//  LoginModel.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import Foundation
struct LoginModel: Identifiable {
//     id = real identity
    let id = UUID()
    let email: String
    let password: String
}
