//
//  TranslatorViewModel.swift
//  Translator
//
//  Created by Roman Golub on 12.02.2025.
//

import SwiftUI
import AVFoundation

@MainActor
class TranslatorViewModel: ObservableObject {
    // MARK: - Properties
    @AppStorage("selectedAnimal") var selectedAnimal: String = Icons.dog
    
    @Published var isHuman: Bool = true
    @Published var showRecording: Bool = true
    @Published var showProcessTranslation: Bool = false
    @Published var navigateToResult: Bool = false
    @Published var isMicrophonePermissionGranted: Bool = false
    
    // MARK: - Methods
    func toggleRole() {
        isHuman.toggle()
    }
    
    func selectAnimal(_ animal: String) {
        selectedAnimal = animal
    }
    
    func requestMicrophoneAccess() {
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] granted in
            DispatchQueue.main.async {
                if granted {
                    self?.startRecordingProcess()
                } else {
                    self?.showPermissionDeniedAlert()
                }
            }
        }
    }
    
    func resetState() {
        showRecording = true
        showProcessTranslation = false
        navigateToResult = false
    }
    
    // MARK: - Private methods
    private func startRecordingProcess() {
        showRecording = false
        withAnimation(.linear(duration: 3)) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showProcessTranslation = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showProcessTranslation = false
                    self.navigateToResult = true
                }
            }
        }
    }
    
    private func showPermissionDeniedAlert() {
        let alert = UIAlertController(
            title: "Enable Microphone Access",
            message: "Please allow access to your mircophone to use the app’s features",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
             if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                 UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
             }
         }))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(alert, animated: true)
        }
    }
}
