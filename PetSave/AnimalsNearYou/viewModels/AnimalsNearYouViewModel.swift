//
//  AnimalsNearYouViewModel.swift
//  PetSave
//
//  Created by Simon Rofe on 16/6/2022.
//

import Foundation

protocol AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [Animal]
}

protocol AnimalStore {
    func save(animals: [Animal]) async throws
}

@MainActor
final class AnimalsNearYouViewModel: ObservableObject {
    @Published var isLoading = true
    private let animalFetcher: AnimalsFetcher
    private let animalStore: AnimalStore

    init(isLoading: Bool = true, animalFetcher: AnimalsFetcher, animalStore: AnimalStore) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
        self.animalStore = animalStore
    }

    func fetchAnimals() async {
        let animals = await animalFetcher.fetchAnimals(page: 1)
        do {
            try await animalStore.save(animals: animals)
        } catch {
            print("Error storing anumals... \(error.localizedDescription)")
        }
        isLoading = false
    }
}
