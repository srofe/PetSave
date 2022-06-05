//
// Created by Simon Rofe on 5/6/2022.
//

import CoreData

extension AnimalEnvironment: CoreDataPersistable {
    var keyMap: [PartialKeyPath<AnimalEnvironment>: String] {
        [
            \.children: "children",
            \.dogs: "dogs",
            \.cats: "cats",
            \.id: "id"
        ]
    }

    typealias ManagedType = AnimalEnvironmentEntity
}
