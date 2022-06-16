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
    private let requestManager = RequestManager()

    init(isLoading: Bool = true) {
        self.isLoading = isLoading
    }

    func fetchAnimals() async {
        do {
            let animalsContainer: AnimalsContainer = try await requestManager.perform(
                AnimalsRequest.getAnimalsWith(
                    page: 1,
                    latitude: nil,
                    longitude: nil
                )
            )
            for var animal in animalsContainer.animals {
                animal.toManagedObject()
            }
            isLoading = false
        } catch {
            print("Error fetching anumals... \(error.localizedDescription)")
        }
    }
}
