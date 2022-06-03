//
//  ContactEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(ContactEntity)
public class ContactEntity: NSManagedObject {
    @NSManaged public var email: String?
    @NSManaged public var id: Int64
    @NSManaged public var phone: String?
    @NSManaged public var address: AddressEntity?
    @NSManaged public var animal: AnimalEntity?
    @NSManaged public var organization: NSSet?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactEntity> {
        NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
    }
}

extension ContactEntity: Identifiable {}

extension ContactEntity {
    @objc(addOrganizationObject:)
    @NSManaged public func addToOrganization(_ value: OrganizationEntity)

    @objc(removeOrganizationObject:)
    @NSManaged public func removeFromOrganization(_ value: OrganizationEntity)

    @objc(addOrganization:)
    @NSManaged public func addToOrganization(_ values: NSSet)

    @objc(removeOrganization:)
    @NSManaged public func removeFromOrganization(_ values: NSSet)
}
