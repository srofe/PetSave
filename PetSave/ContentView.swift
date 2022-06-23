//
//  ContentView.swift
//  PetSave
//
//  Created by Simon Rofe on 25/5/2022.
//

import SwiftUI

struct ContentView: View {
    let managedObjectContext = PersistenceController.shared.container.viewContext

    var body: some View {
        TabView {
            AnimalsNearYouView(
                viewModel: AnimalsNearYouViewModel(
                    animalFetcher: FetchAnimalsService(
                        requestManager:
                            RequestManager()
                    ),
                    animalStore: AnimalStoreService(
                        context: PersistenceController.shared.container.newBackgroundContext()
                    )
                )
            )
            .tabItem {
                Label("Near you", systemImage: "location")
            }
            .environment(\.managedObjectContext, managedObjectContext)
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .environment(\.managedObjectContext, managedObjectContext)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
