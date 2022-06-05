//
// Created by Simon Rofe on 5/6/2022.
//

import CoreData

extension User: CoreDataPersistable {
    var keyMap: [PartialKeyPath<User>: String] {
        [
            \.name: "name",
            \.password: "password",
            \.extra: "extra",
            \.id: "id"
        ]
    }

    typealias ManagedType = UserEntity
}
