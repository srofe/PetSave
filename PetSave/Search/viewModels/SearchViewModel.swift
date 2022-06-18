//
//  SearchViewModel.swift
//  PetSave
//
//  Created by Simon Rofe on 18/6/2022.
//

import Foundation

protocol AnimalSearcher {
    func searchAnimal(
        by text: String,
        age: AnimalSearchAge,
        type: AnimalSearchType
    ) async -> [Animal]
}

final class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    var shouldFilter: Bool {
        !searchText.isEmpty
    }
    private let animalSearcher: AnimalSearcher
    private let animalStore: AnimalStore

    init(animalSearcher: AnimalSearcher, animalStore: AnimalStore) {
        self.animalSearcher = animalSearcher
        self.animalStore = animalStore
    }

    func search() {
        Task {
            let animals = await animalSearcher.searchAnimal(
                by: searchText,
                age: .none,
                type: .none
            )
            do {
                try await animalStore.save(animals: animals)
            } catch {
                print("Error storing animals... \(error.localizedDescription)")
            }
        }
    }
}
