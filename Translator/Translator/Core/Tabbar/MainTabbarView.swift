//
//  MainTabbarView.swift
//  Translator
//
//  Created by Roman Golub on 12.02.2025.
//

import SwiftUI

struct MainTabbarView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    
    let tabItems = [
        TabbarItem(image: Icons.translator, title: "Translator") {},
        TabbarItem(image: Icons.clicker, title: "Clicker") {}
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                
                ZStack {
                    
                    if selectedTab == 0 {
                        
                        TranslatorView()
                        
                    }
                    else if selectedTab == 1 {
                        
                        SettingsView()
                        
                    }
                    
                }
                .ignoresSafeArea()
            }
            
            CustomTabbarView(tabbarItems: self.tabItems, selectedTab: $selectedTab)
                .padding(.bottom, 20)
            
        }
        
    }
}

#Preview {
    MainTabbarView()
}

