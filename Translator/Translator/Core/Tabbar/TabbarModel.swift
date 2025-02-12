//
//  TabbarModel.swift
//  Translator
//
//  Created by Roman Golub on 12.02.2025.
//

import Foundation

struct TabbarItem : Identifiable, Equatable {
    var id = UUID()
    var image: String
    var title: String
    var action: () -> Void
    
    static func == (lhs: TabbarItem, rhs: TabbarItem) -> Bool {
        return lhs.id == rhs.id
    }
}
