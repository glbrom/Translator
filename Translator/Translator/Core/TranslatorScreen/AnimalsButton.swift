//
//  AmimalsButton.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import SwiftUI

struct AnimalsButton: View {
    // MARK: - Properties
    @Binding var isSelected: Bool
    
    var icon: String
    var color: Color
    var action: (() -> Void)?
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            isSelected.toggle()
            action?()
        }) {
            Rectangle()
                .foregroundColor(color)
                .frame(width: 70, height: 70)
                .background(.red)
                .cornerRadius(16)
                .overlay(
                    Image(icon)
                        .resizable()
                        .frame(width: 40, height: 40)
                )
        }
    }
}

#Preview {
    AnimalsButton(isSelected: .constant(true), icon: Icons.dog, color: Color.lightGreen)
}
