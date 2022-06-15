//
//  VideoLinkEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(VideoLinkEntity)
public class VideoLinkEntity: NSManagedObject {
    @NSManaged public var embedded: URL?
    @NSManaged public var id: Int64
    @NSManaged public var animal: AnimalEntity?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VideoLinkEntity> {
        NSFetchRequest<VideoLinkEntity>(entityName: "VideoLinkEntity")
    }
}

extension VideoLinkEntity: Identifiable {}
