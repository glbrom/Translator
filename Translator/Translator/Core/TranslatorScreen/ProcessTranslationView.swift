//
//  ProcessTranslationView.swift
//  Translator
//
//  Created by Roman Golub on 12.02.2025.
//

import SwiftUI

struct ProcessTranslationView: View {
    // MARK: - Methods
    var selectedAnimal: String
    
    // MARK: - Body
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    Spacer()
                    Text("Process of translation...")
                        .font(.konkhmerFont(.regular, size: 16))
                        .padding(.bottom, 52)
                    
                    Image(selectedAnimal)
                        .padding(.bottom, 134)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundGradient()
        }
    }
}

#Preview {
    ProcessTranslationView(selectedAnimal: Icons.cat)
}
