//
//  FeaturesView.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(premiumFeatures, id : \.self){ feature in
                    FeatureItem(imageTitle: feature.featureImage, title: feature.featureTitle, subtitle: feature.featureSubtitle)
                }
            }
            .padding(.leading, 20)
        }
        .padding(.vertical)
    }
}

#Preview {
    FeaturesView()
}

struct FeatureItem : View {
    var imageTitle : String
    var title : String
    var subtitle : String
    var body: some View {
        HStack{
            VStack(alignment : .leading){
                Image(imageTitle)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.bottom,6)
                Text(title)
                    .customFont(size: 20, design: .RubikMedium)
                    .foregroundStyle(.white)
                    .padding(.bottom,4)
                Text(subtitle)
                    .customFont(size: 13, design: .RubikRegular)
                    .foregroundStyle(.gray)
                    
            }
            .padding(.horizontal)
            Spacer()
        }
        .frame(width: 156, height: 130)
        .background(Color.white.opacity(0.05))
        .cornersRadius(radius: 14)
        
    }
}
