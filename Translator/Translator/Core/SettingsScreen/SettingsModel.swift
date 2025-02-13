//
//  SettingsModel.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import Foundation

enum SettingsButton: Int, Identifiable, CaseIterable {
    case rateUs
    case shareApp
    case contactUs
    case restorePurchases
    case privacyPolicy
    case termsOfUse
    
    var title: String {
        switch self {
        case .rateUs: return "Rate Us"
        case .shareApp: return "Share App"
        case .contactUs: return "Contact Us"
        case .restorePurchases: return "Restore Purchases"
        case .privacyPolicy: return "Privacy Policy"
        case .termsOfUse: return "Terms of Use"
        }
    }
    
    var id: Int { return self.rawValue}
}
