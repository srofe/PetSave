//
//  AnimalsNearYouView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalsNearYouView: View {
    @ObservedObject var viewModel: AnimalsNearYouViewModel
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)
        ],
        animation: .default
    )
    private var animals: FetchedResults<AnimalEntity>

    var body: some View {
        NavigationView {
            AnimalListView(animals: animals) {
                if !animals.isEmpty && viewModel.hasMoreAnimals {
                    HStack(alignment: .center) {
                        LoadingAnimation()
                            .frame(maxWidth: 125, minHeight: 125)
                        Text("Loading more animals...")
                    }
                    .task {
                        await viewModel.fetchMoreAnimals()
                    }
                }
            }
            .task {
                await viewModel.fetchAnimals()
            }
            .listStyle(.plain)
            .navigationTitle("Animals near you")
            .overlay {
                if viewModel.isLoading && animals.isEmpty {
                    ProgressView("Finding Animals near you...")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnimalsNearYouView(
                viewModel: AnimalsNearYouViewModel(
                    animalFetcher: AnimalsFetcherMock(),
                    animalStore: AnimalStoreService(
                        context: PersistenceController.preview.container.viewContext
                    )
                )
            )
            AnimalsNearYouView(
                viewModel: AnimalsNearYouViewModel(
                    animalFetcher: AnimalsFetcherMock(),
                    animalStore: AnimalStoreService(
                        context: PersistenceController.preview.container.viewContext
                    )
                )
            )
            .preferredColorScheme(.dark)
        }
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
