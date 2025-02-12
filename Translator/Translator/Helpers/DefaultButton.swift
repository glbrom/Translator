//
//  DefaultButton.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import SwiftUI

struct DefaultButton: View {
    var icon: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(icon)
        }
    }
}

#Preview {
    DefaultButton(icon: Icons.cat, action: {})
}
