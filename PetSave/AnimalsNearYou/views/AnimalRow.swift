//
// Created by Simon Rofe on 29/5/2022.
//

import SwiftUI

struct AnimalRow: View {
    let animal: AnimalEntity
    var animalName: String
    var animalType: String
    var animalDescription: String
    var animalBreedAndType: String {
        "\(animal.breed) \(animalType)"
    }

    init(animal: AnimalEntity) {
        self.animal = animal
        animalName = animal.name ?? ""
        animalType = animal.type ?? ""
        animalDescription = animal.desc ?? ""
    }

    var body: some View {
        HStack {
            AsyncImage(url: animal.picture) { image in
                image
                    .resizable()
            } placeholder: {
                Image("rw-logo")
                    .resizable()
                    .overlay {
                        if animal.picture != nil {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.gray.opacity(0.4))
                        }
                    }
            }
                .aspectRatio(contentMode: .fit)
                .frame(width: 112, height: 112)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(animalName)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .accessibilityLabel(animalName)
                Text(animalBreedAndType)
                    .font(.callout)
                    .accessibilityLabel(animalBreedAndType)
                if let description = animal.desc {
                    Text(description)
                        .lineLimit(2)
                        .font(.footnote)
                        .accessibilityLabel(description)
                }
                HStack {
                    Text(animal.age.rawValue)
                        .modifier(AnimalAttributesCard(color: animal.age.color))
                        .accessibilityLabel(animal.age.rawValue)
                    Text(animal.gender.rawValue)
                        .modifier(AnimalAttributesCard(color: .pink))
                        .accessibilityLabel(animal.gender.rawValue)
                }
            }
            .lineLimit(1)
        }
    }
}

struct AnimalRow_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            AnimalRow(animal: animal)
        }
    }
}
