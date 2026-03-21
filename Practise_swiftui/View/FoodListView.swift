//
//  FoodListView.swift
//  Practise_swiftui
//
//  Created by Rose Visuals on 21/03/2026.
//

import SwiftUI

struct FoodListsView: View {
// view model handles the loading of state, errors, search filtering & managing the list of foods
/// for storing a reference type e.g a class of my view model so that an instance is created and owned by a view
    ///works with observableobject & @published so that the ui updates reactively
    ///creates and owns the object, keeps it alive across view updates
    ///used to call the created viewmodel
    @StateObject private var viewModel = FoodViewModel()
//    holds the search query of the user
/// if used for reference types it doesnt properly let swifui of the changs to the published properties and may recreate the object unexpecteldly when the view redraws
    /// view model wouldn't notify the view (ui) about the property changes
    /// can cause the object to be recreated `asin since view are recreated periodically it may recreate the view then the viewmodel`
    @State private var searchText = ""

    var body: some View {

        NavigationStack {

            VStack {

                TextField("Search...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                } else {

                    ForEach(viewModel.filteredFoods(searchText: searchText)) { food in
                        Text(food.name)
                    }

                }
            }
            .onAppear {
                viewModel.fetchFoods()
            }
        }
    }
}

#Preview {
    FoodListsView()
}
