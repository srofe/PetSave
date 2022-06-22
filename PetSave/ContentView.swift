//
//  ContentView.swift
//  PetSave
//
//  Created by Simon Rofe on 25/5/2022.
//

import SwiftUI

struct ContentView: View {
    let managedObjectContext = PersistenceController.shared.container.viewContext
    @StateObject var tabNavigator = PetSaveTabNavigator()

    var body: some View {
        TabView(selection: $tabNavigator.currentTab) {
            AnimalsNearYouView(
                viewModel: AnimalsNearYouViewModel(
                    animalFetcher: FetchAnimalsService(requestManager: RequestManager()),
                    animalStore: AnimalStoreService(context: PersistenceController.shared.container.newBackgroundContext())
                ))
            .badge(2)
            .tag(PetSaveTabType.nearYou)
            .tabItem {
                Label("Near you", systemImage: "location")
            }
            .environment(\.managedObjectContext, managedObjectContext)
            SearchView()
                .tag(PetSaveTabType.search)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .environment(\.managedObjectContext, managedObjectContext)
        }
        .onOpenURL { url in
            let type = PetSaveTabType.deepLinkType(url: url)
            self.tabNavigator.switchTab(to: type)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
