//
//  ContentView.swift
//  Translator
//
//  Created by Roman Golub on 11.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    // MARK: - Properties
    @State private var isSelected: Bool = true
   
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Text("Translator")
                    .font(.konkhmerFont(.regular, size: 32))
                    .padding(.top, 20)
                
               
                
                HStack {
                    Text("HUMAN")
                       
                    
                    DefaultButton(icon: Icons.arrowsLeftRight, action:{})
                    
                    Text("PET")
                      
                }
                .font(.konkhmerFont(.regular, size: 16))
                
                HStack {
                    VStack {
                        DefaultButton(icon: Icons.speak, action: {})
                            
                           
                            Text("Start Speak")
                                .font(.konkhmerFont(.regular, size: 16))
                        
                    }
                    .frame(width: 178, height: 176)
                    .background(.white)
                .cornerRadius(16)
                .shadow(color: .primary.opacity(0.2), radius: 5.0)
                    
                    VStack {
                        AnimalsButton(isSelected: $isSelected, icon: Icons.cat, color: .lightBlue, action: {})
                        
                        AnimalsButton(isSelected: $isSelected, icon: Icons.dog, color: .lightGreen, action: {})
                        
                       
                        
                    }
                    .frame(width: 107, height: 176)
                    .background(.white)
                .cornerRadius(16)
                .shadow(color: .primary.opacity(0.2), radius: 5.0)
                }
                
                
                Image(isSelected ? Icons.dog : Icons.cat)
                    
       
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundGradient()
        
    }
}

#Preview {
    TranslatorView()
}

