//
//  AnimalsNearYouViewModel.swift
//  PetSave
//
//  Created by Simon Rofe on 16/6/2022.
//

import Combine

protocol AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [Animal]
}

final class AnimalsNearYouViewModel: ObservableObject {
    @Published var isLoading = true
    private let animalFetcher: AnimalsFetcher

    init(isLoading: Bool = true, animalFetcher: AnimalsFetcher) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
    }

    func fetchAnimals() async {
        let animals = await animalFetcher.fetchAnimals(page: 1)
        for var animal in animals {
            animal.toManagedObject()
        }
        isLoading = false
    }
}
