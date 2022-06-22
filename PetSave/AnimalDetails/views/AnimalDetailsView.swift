//
//  AnimalDetailsView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalDetailsRouter: NavigationRouter {
    typealias Data = AnimalEntity

    func navigate<T: View>(data: AnimalEntity, navigationState: NavigationState, view: (() -> T)?) -> AnyView {
        AnyView(NavigationLink(
            destination: AnimalDetailsView(name: data.name ?? "")
                .environmentObject(navigationState)
        ) {
            view?()
        }
        )
    }
}

struct AnimalDetailsView: View {
    var name: String
    @EnvironmentObject var navigationState: NavigationState

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
            AnimalDetailsView(name: "Snow")
                .environmentObject(NavigationState())
        }
        .previewDevice("iPhone 12 Pro")
        .previewDisplayName("iPhone 12 Pro")
    }
}
