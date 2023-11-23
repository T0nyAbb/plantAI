//
//  GradientBackgroundView.swift
//  plantAI
//
//  Created by Antonio Abbatiello on 17/11/23.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                .clear.opacity(0.4),
                .teal.opacity(0.3)
            ]),
            startPoint: .bottomTrailing,
            endPoint: .topLeading
        )
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GradientBackgroundView()
}
