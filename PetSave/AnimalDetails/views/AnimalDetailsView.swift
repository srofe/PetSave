//
//  AnimalDetailsView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalDetailsView: View {
    var name: String
    @Binding var isNavigatingDisabled: Bool

    var body: some View {
        Text(name)
        Button(isNavigatingDisabled ? "Enable Navigation" : "Disable Navigation") {
            isNavigatingDisabled.toggle()
        }
    }
}

struct AnimalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalDetailsView(name: "Kiki", isNavigatingDisabled: .constant(false))
        }
        .previewLayout(.sizeThatFits)
        .previewDisplayName("iPhone SE (3rd generation)")

        NavigationView {
            AnimalDetailsView(name: "Patch", isNavigatingDisabled: .constant(false))
        }
        .previewDevice("iPhone 12 Pro")
        .previewDisplayName("iPhone 12 Pro")
    }
}
