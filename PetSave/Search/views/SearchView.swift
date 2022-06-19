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
    var filteredAnimals: [AnimalEntity] {
        guard viewModel.shouldFilter else { return [] }
        return animals.filter {
            if viewModel.searchText.isEmpty {
                return true
            }
            return $0.name?.contains(viewModel.searchText) ?? false
        }
    }
    @State var filterPickerIsPresented = false

    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .navigationTitle("Find your future pet")
                .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.search()
                }
                .overlay {
                    if filteredAnimals.isEmpty && !viewModel.searchText.isEmpty {
                        EmptyResultsView(query: viewModel.searchText)
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button {
                            filterPickerIsPresented.toggle()
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                        .sheet(isPresented: $filterPickerIsPresented) {
                            NavigationView {
                                SearchFilterView(viewModel: viewModels)
                            }
                        }
                    }
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(
            viewModel: SearchViewModel(
                animalSearcher: AnimalSearcherMock(),
                animalStore: AnimalStoreService(
                    context: PersistenceController.preview.container.viewContext
                )
            )
        )
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
