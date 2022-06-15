//
// Created by Simon Rofe on 5/6/2022.
//

import CoreData

extension AnimalAttributes: CoreDataPersistable {
    var keyMap: [PartialKeyPath<AnimalAttributes>: String] {
        [
            \.spayedNeutered: "spayedNeutered",
            \.houseTrained: "houseTrained",
            \.declawed: "declawed",
            \.specialNeeds: "specialNeeds",
            \.shotsCurrent: "shotsCurrent",
            \.id: "id"
        ]
    }

    typealias ManagedType = AnimalAttributesEntity
}
