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
