//
//  CustomFonts.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import SwiftUI

enum KonkhmerSleokchherFont: String {
    case regular = "KonkhmerSleokchher-Regular"
}

extension Font {
    static func interFont(_ font: KonkhmerSleokchherFont, size: CGFloat) -> Font {
        return .custom(font.rawValue, size: size)
    }
}
