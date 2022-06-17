//
// Created by Simon Rofe on 17/6/2022.
//

import CoreData

struct AnimalStoreService {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

// MARK :- Animal Store
extension AnimalStoreService: AnimalStore {
    func save(animals: [Animal]) async throws {
        for var animal in animals {
            animal.toManagedObject(context: context)
        }
        try context.save()
    }
}
