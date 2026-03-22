//
//  sharedstate.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import Foundation
import SwiftUI

@main
struct SharedStateApp: App {
    @StateObject private var auth = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(auth)
        }
    }
}
