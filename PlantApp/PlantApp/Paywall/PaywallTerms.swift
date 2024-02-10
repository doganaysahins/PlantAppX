//
//  PaywallTerms.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import SwiftUI

struct PaywallTerms : View {
    var body: some View {
        VStack{
            Text("After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable")
                .customFont(size: 9, design: .RubikRegular)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            HStack(alignment : .center, spacing: 2){
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Text("Terms")
                        .customFont(size: 11, design: .RubikRegular)
                })
                Text("•")
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Text("Restore")
                        .customFont(size: 11, design: .RubikRegular)
                })
                Text("•")
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Text("Restore")
                        .customFont(size: 11, design: .RubikRegular)
                })
            }
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    PaywallTerms()
}
