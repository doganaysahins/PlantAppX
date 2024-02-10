//
//  CategoryCard.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import SwiftUI
import Kingfisher

struct CategoryCard: View {
    var categoryImage : String
    var categoryName : String
    var body: some View {
        KFImage(URL(string: categoryImage))
            .placeholder({
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(alignment: .center) {
                        ProgressView().tint(Color.mainGreenColor)
                    }
            })
            .resizable()
            .scaledToFill()
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 0.2))
            .cornerRadius(12)
            .overlay(alignment : .topLeading){
                Text(categoryName)
                    .customFont(size: 16, design: .RubikSemibold)
                    .foregroundStyle(Color.mainTextColor)
                    .multilineTextAlignment(.leading)
                    .padding(20)
            }
    }
}

#Preview {
    CategoryCard(categoryImage: "", categoryName: "")
}
