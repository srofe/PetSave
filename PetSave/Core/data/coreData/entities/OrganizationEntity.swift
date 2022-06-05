//
//  OrganizationEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(OrganizationEntity)
public class OrganizationEntity: NSManagedObject {
    @NSManaged public var distance: Double
    @NSManaged public var id: Int64
    @NSManaged public var contact: ContactEntity?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrganizationEntity> {
        NSFetchRequest<OrganizationEntity>(entityName: "OrganizationEntity")
    }
}

extension OrganizationEntity: Identifiable {}
