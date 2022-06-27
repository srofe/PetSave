//
//  AnimalDetailCard.swift
//  PetSave
//
//  Created by Simon Rofe on 26/5/2022.
//

import SwiftUI

extension Color {
    func darken(_ amount: Double) -> Color {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let darkenedColor = UIColor(
            red: min(red - amount / 100, 1.0),
            green: min(green - amount / 100, 1.0),
            blue: min(blue - amount / 100, 1.0),
            alpha: 1.0)
        return Color(darkenedColor)
    }
}

struct AnimalDetailCard: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
            Text(value)
                .font(.headline)
        }
        .padding(.vertical)
        .frame(width: 96)
        .background(color.opacity(0.2))
        .foregroundColor(color.darken(40.0))
        .cornerRadius(8)
    }
}

struct AnimalDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            AnimalDetailCard(
                title: "Age",
                value: "Adult",
                color: .green
            )
            AnimalDetailCard(
                title: "Age",
                value: "Baby",
                color: .blue
            )
        }
    }
}
