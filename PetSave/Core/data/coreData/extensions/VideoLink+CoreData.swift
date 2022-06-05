//
// Created by Simon Rofe on 5/6/2022.
//

import CoreData

extension VideoLink: CoreDataPersistable {
    var keyMap: [PartialKeyPath<VideoLink>: String] {
        [
            \.embedded: "embedded",
            \.id: "id"
        ]
    }

    typealias ManagedType = VideoLinkEntity
}
