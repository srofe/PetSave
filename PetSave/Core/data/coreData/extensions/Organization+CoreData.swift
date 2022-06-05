//
// Created by Simon Rofe on 5/6/2022.
//

import CoreData

extension Organization: CoreDataPersistable {
    var keyMap: [PartialKeyPath<Organization>: String] {
        [
            \.distance: "distance",
            \.contact: "contact"
        ]
    }

    init(managedObject: OrganizationEntity?) {
        guard let managedObject = managedObject else { return }
        self.id = Int(managedObject.id)
        self.distance = managedObject.distance
        guard let contact = managedObject.contact else { return }
        self.contact = Contact(managedObject: contact)
    }

    mutating func toManagedObject(context: NSManagedObjectContext) -> OrganizationEntity {
        let persistedValue = OrganizationEntity.init(context: context)
        persistedValue.distance = self.distance ?? 0.0
        if var contact = self.contact {
            persistedValue.contact = contact.toManagedObject(context: context)
        }
        return persistedValue
    }
}
