//
//  ResultView.swift
//  Translator
//
//  Created by Roman Golub on 12.02.2025.
//

import SwiftUI

struct ResultView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: TranslatorViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var showRepeat = false
    @State private var randomPhrase: String = ""
    
    let phrases = [
        "What are you doing, human?",
        "I’m hungry, feed me!",
        "Hey, let's go for a walk!",
        "Did you forget about me?",
        "I demand attention! Scratch my belly!"
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 14) {
                HStack(alignment: .center) {
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        viewModel.resetState()
                    } label: {
                        Image(Icons.closeIcon)
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 28, height: 28)
                            .padding()
                    }
                    .background(.white)
                    .frame(width: 48, height: 48)
                    .cornerRadius(50)
                    .padding(.leading, 20)
                    
                    Text("Result")
                        .font(.konkhmerFont(.regular, size: 32))
                        .padding(.leading, 70)
                    Spacer()
                    
                }
                .padding(.top, 20)
                
                if showRepeat {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        viewModel.resetState()
                    }) {
                        VStack {
                            
                            HStack(alignment: .center) {
                                Image(Icons.rotateIcon)
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 16, height: 16)
                                
                                Text("Repeat")
                                    .font(.konkhmerFont(.regular, size: 12))
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(width: 291, height: 54)
                        .background(.lightPurple)
                        .cornerRadius(16)
                        .shadow(color: .primary.opacity(0.3), radius: 5.0)
                        .padding(.top, 180)
                    }
                } else {
                    ZStack {
                        Image(Icons.askIcon)
                        
                        Text(randomPhrase)
                            .font(.konkhmerFont(.regular, size: 14))
                            .padding(.bottom, 100)
                    }
                    .frame(width: 291, height: 241)
                    .padding(.top, 72)
                }
                
                Spacer()
                
                Image(viewModel.selectedAnimal)
                    .padding(.bottom, 134)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundGradient()
        .navigationBarBackButtonHidden(true)
        .onAppear {
            randomPhrase = phrases.randomElement() ?? "What are you doing, human?"
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showRepeat = true
            }
        }
    }
}

#Preview {
    ResultView(viewModel: TranslatorViewModel())
}
