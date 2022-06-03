//
//  UserEntity.swift
//  PetSave
//
//  Created by Simon Rofe on 2/6/22.
//

import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {
    @NSManaged public var extra: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }
}

extension UserEntity: Identifiable {}
