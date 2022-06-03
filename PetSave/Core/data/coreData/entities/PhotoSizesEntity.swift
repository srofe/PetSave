//
//  PhotoSizesEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(PhotoSizesEntity)
public class PhotoSizesEntity: NSManagedObject {
    @NSManaged public var full: URL?
    @NSManaged public var id: Int64
    @NSManaged public var large: URL?
    @NSManaged public var medium: URL?
    @NSManaged public var small: URL?
    @NSManaged public var animal: AnimalEntity?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoSizesEntity> {
        NSFetchRequest<PhotoSizesEntity>(entityName: "PhotoSizesEntity")
    }
}

extension PhotoSizesEntity: Identifiable {}
