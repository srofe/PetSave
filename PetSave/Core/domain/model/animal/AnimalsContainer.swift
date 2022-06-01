//
//  AnimalsContainer.swift
//  PetSave
//
//  Created by Simon Rofe on 30/5/2022.
//

struct AnimalsContainer: Decodable {
    let animals: [Animal]
    let pagination: Pagination
}
