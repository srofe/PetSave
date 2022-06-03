//
//  TagEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(TagEntity)
public class TagEntity: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TagEntity> {
        NSFetchRequest<TagEntity>(entityName: "TagEntity")
    }
}

extension TagEntity: Identifiable {}
