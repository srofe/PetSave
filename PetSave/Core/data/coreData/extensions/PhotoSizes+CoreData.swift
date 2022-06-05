//
// Created by Simon Rofe on 5/6/2022.
//

import CoreData

extension PhotoSizes: CoreDataPersistable {
    var keyMap: [PartialKeyPath<PhotoSizes>: String] {
        [
            \.small: "small",
            \.medium: "medium",
            \.large: "large",
            \.full: "full",
            \.id: "id"
        ]
    }

    typealias ManagedType = PhotoSizesEntity
}
