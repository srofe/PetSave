//
//  AnimalDetailsView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalDetailsView: View {
    var name: String

    var body: some View {
        Text(name)
    }
}

struct AnimalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalDetailsView(name: "Kiki")
        }
        .previewLayout(.sizeThatFits)
        .previewDisplayName("iPhone SE (3rd generation)")

        NavigationView {
            AnimalDetailsView(name: "Patch")
        }
        .previewDevice("iPhone 12 Pro")
        .previewDisplayName("iPhone 12 Pro")
    }
}
