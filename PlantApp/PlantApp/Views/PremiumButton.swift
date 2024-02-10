//
//  PremiumButton.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import SwiftUI

struct PremiumButton: View {
    var action : () -> ()
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(alignment : .center){
                Image("premiumbox-icon")
                
                VStack(alignment : .leading, spacing : 4){

                    Text("FREE ")
                        .font(.system(size: 16))
                        .bold()
                    +
                    Text("Premium Available")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Tap to upgrade your account!")
                        .font(.system(size: 13))
                }
                .foregroundStyle(
                    .linearGradient(colors: [.premiumGradientColor, .premiumGradientColor1], startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                Image("arrow-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 22)
            }
            .frame(maxWidth : .infinity)
            .frame(height: 64)
            .background(Color.premiumBoxBackground)
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
        })
    }
}

#Preview {
    PremiumButton(action: {
        
    })
}
