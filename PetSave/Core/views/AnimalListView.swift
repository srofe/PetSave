//
// Created by Simon Rofe on 18/6/2022.
//

import SwiftUI

struct AnimalListView<Content, Data>: View where Content: View, Data: RandomAccessCollection, Data.Element: AnimalEntity {
    let animals: Data
    let footer: Content

    init(animals: Data, @ViewBuilder  footer: () -> Content) {
        self.animals = animals
        self.footer = footer()
    }

    init(animals: Data) where  Content == EmptyView {
        self.init(animals: animals) {
            EmptyView()
        }
    }

    @State var isNavigationDisabled = false
    var body: some View {
        List {
            Button(isNavigationDisabled ? "Enable Navigation" : "Disable Navigation") {
                isNavigationDisabled.toggle()
            }
            ForEach(animals) { animal in
                NavigationLink(
                    destination: AnimalDetailsView(
                        name: animal.name ?? "",
                        isNavigatingDisabled: $isNavigationDisabled)
                ) {
                    AnimalRow(animal: animal)
                }
                .disabled(isNavigationDisabled)
            }
            footer
        }
        .listStyle(.plain)
    }
}

struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalListView(animals: CoreDataHelper.getTestAnimalEntities() ?? [])
        }
        NavigationView {
            AnimalListView(animals: []) {
                Text("This is a footer")
            }
        }
    }
}
