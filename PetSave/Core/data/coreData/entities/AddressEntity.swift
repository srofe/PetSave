//
//  AddressEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(AddressEntity)
public class AddressEntity: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var address1: String?
    @NSManaged public var address2: String?
    @NSManaged public var city: String
    @NSManaged public var postcode: String
    @NSManaged public var state: String
    @NSManaged public var country: String
    @NSManaged public var contact: NSSet?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressEntity> {
        NSFetchRequest<AddressEntity>(entityName: "AddressEntity")
    }
}

extension AddressEntity: Identifiable {}

extension AddressEntity {
    @objc(addContactObject:)
    @NSManaged public func addToContact(_ value: ContactEntity)

    @objc(removeContactObject:)
    @NSManaged public func removeFromContact(_ value: ContactEntity)

    @objc(addContact:)
    @NSManaged public func addToContact(_ values: NSSet)

    @objc(removeContact:)
    @NSManaged public func removeFromContact(_ values: NSSet)
}
