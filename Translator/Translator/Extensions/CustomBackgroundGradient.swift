//
//  CustomBackgroundGradient.swift
//  Translator
//
//  Created by Roman Golub on 12.02.2025.
//

import SwiftUI

extension View {
    func backgroundGradient() -> some View {
        self.background(
            LinearGradient(
                colors: [.bgColorMint, .bgColorWhite],
                startPoint: .bottom,
                endPoint: UnitPoint(x: 0.4, y: -0.4)
            )
        )
    }
}
