//
//  AuthModel.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 22/03/2026.
//

import Foundation
struct AuthModel : Identifiable {
    let id = UUID()
    let email: String
    let username: String
    let password: String
}
