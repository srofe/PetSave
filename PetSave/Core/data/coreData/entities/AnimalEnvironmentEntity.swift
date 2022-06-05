//
//  AnimalEnvironmentEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(AnimalEnvironmentEntity)
public class AnimalEnvironmentEntity: NSManagedObject {
    @NSManaged public var cats: Bool
    @NSManaged public var children: Bool
    @NSManaged public var dogs: Bool
    @NSManaged public var id: Int64
    @NSManaged public var animal: AnimalEntity?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimalEnvironmentEntity> {
        NSFetchRequest<AnimalEnvironmentEntity>(entityName: "AnimalEnvironmentEntity")
    }
}

extension AnimalEnvironmentEntity: Identifiable {}
