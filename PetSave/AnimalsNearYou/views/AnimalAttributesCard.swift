//
// Created by Simon Rofe on 17/6/2022.
//

import SwiftUI

struct AnimalAttributesCard: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .padding(4)
            .background(color.opacity(0.2))
            .cornerRadius(8)
            .foregroundColor(color.darken(+40))
            .font(.subheadline)
    }
}
