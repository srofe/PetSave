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

    var body: some View {
        NavigationView {
            AnimalListView(animals: animals)
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
