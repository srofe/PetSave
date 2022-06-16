//
// Created by Simon Rofe on 17/6/2022.
//

import Foundation

struct AnimalsFetcherMock: AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [Animal] {
        Animal.mock
    }
}
