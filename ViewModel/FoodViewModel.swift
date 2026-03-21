//
//  FoodViewModel.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//
// Overall handles the business logic and state
import SwiftUI
/// is @Published a property of the Combine framework? answer YES
/// used to mark properties on an oberservable project that should show changes on any swiftui view watching them
/// once the property changes all views related will change
internal import Combine
// follows the Observableobject so that swiftui views can reactvively update when data changes
// views can automatically update when properties with @Published change
// cladd foodviewmodel :(inherits) Observable object
class FoodViewModel: ObservableObject {
/// why use @ published being used and not maybe like @focusstate or binding
    /// its for making properties observable by swiftui , to let the ui know when the data changes
    @Published var foods: [FoodItem] = []
//    FoodItem is the model with the data
    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Fetch
    func fetchFoods() {
/// is set to true so that the ui can show a loading indicator
        isLoading = true
        errorMessage = nil

        // Simulate API call
//         mimic network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
// hard coded list of food items
            self.foods = [
                FoodItem(name: "Pizza", price: 20, isFavorite: false, quantity: 1),
                FoodItem(name: "Burger", price: 15, isFavorite: false, quantity: 1)
            ]
/// why setting it back to false
            /// for the ui to know that loading is finished  and can update accordingly i.e hiding the spinner
            self.isLoading = false
        }
    }

    // MARK: - Computed
/// haven't understood its real purpose
    /// it returns results based on the user's input into the search bar
    func filteredFoods(searchText: String) -> [FoodItem] {
        if searchText.isEmpty {
            return foods
        } else {
            return foods.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
