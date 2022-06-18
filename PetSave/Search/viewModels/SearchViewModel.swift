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

final class SeachViewModel: ObservableObject {
    @Published var searchText = ""
    var shouldFilter: Bool {
        !searchText.isEmpty
    }
}
