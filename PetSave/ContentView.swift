//
//  ContentView.swift
//  PetSave
//
//  Created by Simon Rofe on 25/5/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AnimalsNearYouView()
                .tabItem {
                    Label("Near you", systemImage: "location")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
