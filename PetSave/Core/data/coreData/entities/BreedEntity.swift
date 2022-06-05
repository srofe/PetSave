//
//  BreedEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 5/6/2022.
//

import CoreData

@objc(BreedEntity)
public class BreedEntity: NSManagedObject {
    @NSManaged var id: Int64
    @NSManaged var mixed: Bool
    @NSManaged var primary: String?
    @NSManaged var secondary: String?
    @NSManaged var unknown: Bool
    @NSManaged var animal: AnimalEntity?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BreedEntity> {
        NSFetchRequest<BreedEntity>(entityName: "BreedEntity")
    }
}
