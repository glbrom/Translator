//
//  SettingsView.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @State private var selectedButton: SettingsButton?
    @State private var isFullScreenPresented = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 14) {
                    Text("Settings")
                        .font(.konkhmerFont(.regular, size: 32))
                        .padding(.top, 20)
                    
                    ForEach(SettingsButton.allCases, id: \.self) { button in
                        Button(action: {
                            selectedButton = button
                            isFullScreenPresented = true
                        }) {
                            Rectangle()
                                .frame(width: 358, height: 50)
                                .foregroundColor(.lightPurple)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(
                                    HStack {
                                        Text(button.title)
                                            .font(.konkhmerFont(.regular, size: 16))
                                            .foregroundStyle(.darkGrey)
                                        Spacer()
                                        Image(Icons.arrowRight)
                                    }
                                        .padding()
                                )
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundGradient()
            .fullScreenCover(isPresented: $isFullScreenPresented) {
                FullScreenDetailView(button: selectedButton)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct FullScreenDetailView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    let button: SettingsButton?
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Selected: \(button?.title ?? "Rate Us")")
                .font(.konkhmerFont(.regular, size: 16))
                .padding()
            
            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
            .foregroundStyle(.red)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
