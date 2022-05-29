//
//  AnimalsNearYouView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalsNearYouView: View {
    @State var animals: [Animal] = []
    @State var isLoading = true

    var body: some View {
        NavigationView {
            Text("TODO: Animals Near You View")
                .navigationTitle("Animals near you")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    @MainActor
    func stopLoading() async {
        isLoading = false
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView(animals: Animal.mock, isLoading: false)
    }
}
