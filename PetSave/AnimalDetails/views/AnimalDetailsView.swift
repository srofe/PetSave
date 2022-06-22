//
//  AnimalDetailsView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalDetailsView: View {
    var name: String
    @ObservedObject var navigationState: NavigationState

    var body: some View {
        Text(name)
        Button(navigationState.isNavigatingDisabled ? "Enable Navigation" : "Disable Navigation") {
            navigationState.isNavigatingDisabled.toggle()
        }
    }
}

struct AnimalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalDetailsView(name: "Kiki", navigationState: NavigationState())
        }
        .previewLayout(.sizeThatFits)
        .previewDisplayName("iPhone SE (3rd generation)")

        NavigationView {
            AnimalDetailsView(name: "Patch", navigationState: NavigationState())
        }
        .previewDevice("iPhone 12 Pro")
        .previewDisplayName("iPhone 12 Pro")
    }
}
