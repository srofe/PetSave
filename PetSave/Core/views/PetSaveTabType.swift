//
//  PetSaveTabType.swift
//  PetSave
//
//  Created by Simon Rofe on 22/6/2022.
//

import Foundation

enum PetSaveTabType {
    case nearYou
    case search

    static func deepLinkType(url: URL) -> PetSaveTabType {
        if url.scheme == "petsave" {
            switch url.host {
            case "nearYou": return .nearYou
            case "search": return .search
            default: return .nearYou
            }
        }
        return .nearYou
    }
}
