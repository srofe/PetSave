//
//  CoreDataPersistable.swift
//  PetSave
//
//  Created by Simon Rofe on 6/6/2022.
//

import CoreData

protocol UUIDIdentifiable: Identifiable {
    var id: Int? { get set }
}

protocol CoreDataPersistable: UUIDIdentifiable {
    associatedtype ManagedType

    var keyMap: [PartialKeyPath<Self>: String] { get }

    init()
    init(managedObject: ManagedType?)
    mutating func toManagedObject(context: NSManagedObjectContext) -> ManagedType
    func save(context: NSManagedObjectContext) throws
}
