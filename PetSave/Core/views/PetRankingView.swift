//
//  PetRankingView.swift
//  PetSave
//
//  Created by Simon Rofe on 23/6/2022.
//

import SwiftUI

struct PetRankingView: View {
    @ObservableObject var viewModel: PetRankingViewModel
    var animal: AnimalEntity

    init(animal: AnimalEntity) {
        self.animal = animal
        viewModel = PetRankingViewModel(animal: animal)
    }

    var body: some View {
        HStack {
            Text("Rank me!")
                .multilineTextAlignment(.center)
            ForEach(0 ... 4, id: \.self) { index in
                PetRankImage(index: index, recentIndex: $viewModel.ranking)
            }
        }
    }
}

struct PetRanking: View {
    let index: Int
    @State var opacity: Double = 0.4
    @State var tapped = false
    @Binding var recentIndex: Int

    var body: some View {
        Image("creature_dog-and-bone")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(opacity)
            .frame(width: 50, height: 50)
            .onTapGesture {
                opacity = tapped ? 0.4 : 1.0
                tapped.toggle()
                recentIndex = index
            }
            .onChange(of: recentIndex) { value in
                checkOpacity(value: value)
            }
            .onAppear {
                checkOpacity(value: recentIndex)
            }
    }

    func checkOpacity(value: Int) {
        opacity = value >= index ? 1.0 : 0.4
        tapped.toggle()
    }
}

struct PetRankingView_Previews: PreviewProvider {
    static var previews: some View {
        PetRankingView()
    }
}
