//
//  SearchView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct SearchView: View {
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)
        ],
        animation: .default
    )
    private var animals: FetchedResults<AnimalEntity>
    @StateObject var viewModel = SearchViewModel(
        animalSearcher: AnimalSearcherService(requestManager: RequestManager()),
        animalStore: AnimalStoreService(
            context: PersistenceController.shared.container.newBackgroundContext()
        )
    )
    private var filteredAnimals: [AnimalEntity] {
        guard viewModel.shouldFilter else { return [] }
        return animals.filter {
            if viewModel.searchText.isEmpty {
                return true
            }
            return $0.name?.contains(viewModel.searchText) ?? false
        }
    }

    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .navigationTitle("Find your future pet")
                .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
