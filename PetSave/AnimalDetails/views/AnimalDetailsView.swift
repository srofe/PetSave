//
//  AnimalDetailsView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalDetailsView: View {
    var body: some View {
        Text("TODO: Animal Details")
    }
}

struct AnimalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalDetailsView()
        }
        .previewLayout(.sizeThatFits)
        .previewDisplayName("iPhone SE (2nd generation)")

        NavigationView {
            AnimalDetailsView()
        }
        .previewDevice("iPhone 12 Pro")
        .previewDisplayName("iPhone 12 Pro")
    }
}