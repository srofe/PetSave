//
//  AnimalsNearYouView.swift
//  PetSave
//
//  Created by Simon Rofe on 27/5/2022.
//

import SwiftUI

struct AnimalsNearYouView: View {
    @SectionedFetchRequest<String, AnimalEntity>(
        sectionIdentifier: \AnimalEntity.animalSpecies,
        sortDescriptors: [
            NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)
        ],
        animation: .default
    ) var sectionedAnimals: SectionedFetchResults<String, AnimalEntity>
    @State var isLoading = true
    private let requestManager = RequestManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(sectionedAnimals) { animals in
                    Section(header: Text(animals.id)) {
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailsView()) {
                                AnimalRow(animal: animal)
                            }
                        }
                    }
                }
            }
            .task {
                await fetchAnimals()
            }
            .listStyle(.plain)
            .navigationTitle("Animals near you")
            .overlay {
                if isLoading {
                    ProgressView("Finding Animals near you...")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func fetchAnimals() async {
        do {
            let animalsContainer: AnimalsContainer = try await requestManager.perform(AnimalsRequest.getAnimalsWith(
                page: 1,
                latitude: nil,
                longitude: nil))
            for var animal in animalsContainer.animals {
                animal.toManagedObject()
            }
            await stopLoading()
        } catch {
            print("Error fetching animals...\(error)")
        }
    }

    @MainActor
    func stopLoading() async {
        isLoading = false
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView(isLoading: false)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
