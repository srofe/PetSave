//
//  AnimalAttributesEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(AnimalAttributesEntity)
public class AnimalAttributesEntity: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var declawed: Bool
    @NSManaged public var houseTrained: Bool
    @NSManaged public var shotsCurrent: Bool
    @NSManaged public var spayedNeutered: Bool
    @NSManaged public var specialNeeds: Bool
    @NSManaged public var animal: AnimalEntity?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimalAttributesEntity> {
        NSFetchRequest<AnimalAttributesEntity>(entityName: "AnimalAttributesEntity")
    }
}

extension AnimalAttributesEntity: Identifiable {}
