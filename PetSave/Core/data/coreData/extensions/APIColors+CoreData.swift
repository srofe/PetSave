//
// Created by Simon Rofe on 5/6/2022.
//

import CoreData

extension APIColors: CoreDataPersistable {
    var keyMap: [PartialKeyPath<APIColors>: String] {
        [
            \.primary: "primary",
            \.secondary: "secondary",
            \.tertiary: "tertiary"
        ]
    }

    typealias ManagedType = APIColorsEntity
}
