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
    @State var searchText = ""
    private var filteredAnimals: [AnimalEntity] {
        animals.filter {
            if searchText.isEmpty {
                return true
            }
            return $0.name?.contains(searchText) ?? false
        }
    }

    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .navigationTitle("Find your future pet")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
