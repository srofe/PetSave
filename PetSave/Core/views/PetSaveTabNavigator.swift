//
//  PetSaveTabNavigator.swift
//  PetSave
//
//  Created by Simon Rofe on 22/6/2022.
//

import Foundation

class PetSaveTabNavigator: ObservableObject {
    @Published var currentTab: PetSaveTabType = .nearYou

    func switchTab(to tab: PetSaveTabType) {
        currentTab = tab
    }
}

extension PetSaveTabNavigator: Hashable {
    static func == (lhs: PetSaveTabNavigator, rhs: PetSaveTabNavigator) -> Bool {
        lhs.currentTab == rhs.currentTab
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(currentTab)
    }
}
