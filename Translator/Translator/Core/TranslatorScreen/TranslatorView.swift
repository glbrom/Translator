//
//  ContentView.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import SwiftUI
import Lottie
import AVFoundation
import Speech

struct TranslatorView: View {
    @StateObject private var viewModel = TranslatorViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Translator")
                        .font(.konkhmerFont(.regular, size: 32))
                        .padding(.top, 20)
                    
                    HStack(spacing: 50) {
                        Text(viewModel.isHuman ? "HUMAN" : "PET")
                            .font(.konkhmerFont(.regular, size: 16))
                            .frame(width: 80, alignment: .center)
                            .padding(.leading, 20)
                        
                        DefaultButton(icon: Icons.arrowsLeftRight, action: {
                            viewModel.toggleRole()
                        })
                        
                        Text(viewModel.isHuman ? "PET" : "HUMAN")
                            .font(.konkhmerFont(.regular, size: 16))
                            .frame(width: 80, alignment: .center)
                    }
                    
                    HStack(spacing: 35) {
                        VStack(spacing: 20) {
                            Spacer()
                            
                            if viewModel.showRecording {
                                DefaultButton(icon: Icons.speak, action: {
                                    viewModel.requestMicrophoneAccess()
                                })
                                Text("Start Speak")
                                    .font(.konkhmerFont(.regular, size: 16))
                                    .padding(.bottom, 10)
                            } else {
                                LottieView(animation: .named("voiceLottieAnimation"))
                                    .playbackMode(.playing(.toProgress(1, loopMode: .autoReverse)))
                                    .padding(.horizontal, 10)
                                
                                Text("Recording...")
                                    .font(.konkhmerFont(.regular, size: 16))
                                    .padding(.bottom, 10)
                            }
                        }
                        .frame(width: 178, height: 176)
                        .background(.white)
                        .cornerRadius(16)
                        .shadow(color: .primary.opacity(0.2), radius: 5.0)
                        
                        VStack {
                            AnimalsButton(
                                isSelected: viewModel.selectedAnimal == Icons.cat,
                                icon: Icons.cat,
                                color: .lightBlue,
                                action: {
                                    viewModel.selectAnimal(Icons.cat)
                                })
                            
                            AnimalsButton(
                                isSelected: viewModel.selectedAnimal == Icons.dog,
                                icon: Icons.dog,
                                color: .lightGreen,
                                action: {
                                    viewModel.selectAnimal(Icons.dog)
                                })
                        }
                        .frame(width: 107, height: 176)
                        .background(.white)
                        .cornerRadius(16)
                        .shadow(color: .primary.opacity(0.2), radius: 5.0)
                    }
                    .padding(.top, 44)
                    
                    Spacer()
                    
                    Image(viewModel.selectedAnimal)
                        .padding(.bottom, 134)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundGradient()
            .navigationDestination(isPresented: $viewModel.showProcessTranslation) {
                ProcessTranslationView(selectedAnimal: viewModel.selectedAnimal)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            viewModel.showProcessTranslation = false
                            viewModel.navigateToResult = true
                            
                        }
                    }
                    .navigationBarBackButtonHidden(true)
            }
        }
        .fullScreenCover(isPresented: $viewModel.navigateToResult) {
            ResultView(viewModel: viewModel)
        }
    }
}

#Preview {
    TranslatorView()
}
