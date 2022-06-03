//
//  AnimalEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(AnimalEntity)
public class AnimalEntity: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var ageValue: String?
    @NSManaged public var coatValue: String?
    @NSManaged public var desc: String?
    @NSManaged public var distance: Double
    @NSManaged public var genderValue: String?
    @NSManaged public var name: String?
    @NSManaged public var organizationId: String?
    @NSManaged public var publishedAt: String?
    @NSManaged public var ranking: Int32
    @NSManaged public var sizeValue: String?
    @NSManaged public var species: String?
    @NSManaged public var statusValue: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var type: String?
    @NSManaged public var url: URL?
    @NSManaged public var attributes: AnimalAttributesEntity?
    @NSManaged public var colors: APIColorsEntity?
    @NSManaged public var contact: ContactEntity?
    @NSManaged public var environment: AnimalEnvironmentEntity?
    @NSManaged public var photos: NSSet?
    @NSManaged public var videos: NSSet?
}

extension AnimalEntity: Identifiable {}

extension AnimalEntity {
    @objc(addPhotosObject:)
    @NSManaged public func addToPhotos(_ value: PhotoSizesEntity)

    @objc(removePhotosObject:)
    @NSManaged public func removeFromPhotos(_ value: PhotoSizesEntity)

    @objc(addPhotos:)
    @NSManaged public func addToPhotos(_ values: NSSet)

    @objc(removePhotos:)
    @NSManaged public func removeFromPhotos(_ values: NSSet)
}

extension AnimalEntity {
    @objc(addVideosObject:)
    @NSManaged public func addToVideos(_ value: VideoLinkEntity)

    @objc(removeVideosObject:)
    @NSManaged public func removeFromVideos(_ value: VideoLinkEntity)

    @objc(addVideos:)
    @NSManaged public func addToVideos(_ values: NSSet)

    @objc(removeVideos:)
    @NSManaged public func removeFromVideos(_ values: NSSet)
}
