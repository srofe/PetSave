//
//  Breed+CoreData.swift
//  PetSave
//
//  Created by Simon Rofe on 6/6/2022.
//

import CoreData

extension Breed: CoreDataPersistable {
    var keyMap: [PartialKeyPath<Breed> : String] {
        [
            \.primary: "primary",
             \.secondary: "secondary",
             \.mixed: "mixed",
             \.unknown: "unknown",
             \.id: "id"
        ]
    }

    typealias ManagedType = BreedEntity
}
