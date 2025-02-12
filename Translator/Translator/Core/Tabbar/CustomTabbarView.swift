//
//  CustomTabbarView.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import SwiftUI

struct CustomTabbarView: View {
    // MARK: - Properties
    var tabbarItems: [TabbarItem]
    @Binding var selectedTab: Int
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 42) {
            ForEach(tabbarItems.indices, id: \.self) { index in
                let item = tabbarItems[index]
                
                Button {
                    self.selectedTab = index
                    item.action()
                } label: {
                    VStack(spacing: 4) {
                        Image(item.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(self.selectedTab == index ? .black : .gray)
                        
                        Text(item.title)
                            .font(.konkhmerFont(.regular, size: 12))
                            .foregroundStyle(self.selectedTab == index ? .black : .gray)
                    }
                }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
                .frame(width: 216, height: 82)
        }
    }
}

#Preview {
    CustomTabbarView(
        tabbarItems: [
            TabbarItem(image: Icons.translator, title: "Translator", action: {}),
            TabbarItem(image: Icons.clicker, title: "Clicker", action: {})
        ],
        selectedTab: .constant(0)
    )
}
