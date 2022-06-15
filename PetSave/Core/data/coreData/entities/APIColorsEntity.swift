//
//  APIColorsEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(APIColorsEntity)
public class APIColorsEntity: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var primary: String?
    @NSManaged public var secondary: String?
    @NSManaged public var tertiary: String?
    @NSManaged public var animal: AnimalEntity?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<APIColorsEntity> {
        NSFetchRequest<APIColorsEntity>(entityName: "APIColorsEntity")
    }
}

extension APIColorsEntity: Identifiable {}
