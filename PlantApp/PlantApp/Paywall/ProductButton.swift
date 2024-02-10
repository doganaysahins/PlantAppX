//
//  ProductButton.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import SwiftUI

struct ProductButton : View{
    var product : ProductInfo
    @StateObject var paywallProduct : PaywallProductController
    
    var body: some View{
        ZStack{
            HStack{
                Image(paywallProduct.selectedProduct?.id == product.id ? "active-circle" : "inactive-circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading, spacing : 2){
                    Text("1 " + paywallProduct.unitStringPeriod(unit: product.unit))
                        .customFont(size: 16, design: .RubikBold)
                        .foregroundStyle(.white)
                    Text(paywallProduct.trialNew(products: product))
                        .customFont(size: 12, design: .RubikRegular)
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
            .padding(.leading, 16)
            Rectangle()
                .foregroundStyle(
                    Color.white.opacity(0.05))
                .frame(maxWidth: .infinity)
                .frame(height : 60)
                .cornerRadius(14)
                .zIndex(-3)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(paywallProduct.selectedProduct?.id == product.id ? Color.mainGreenColor : Color.gray.opacity(0.3), lineWidth: 1.5)
                )
        }
        .overlay(alignment: .topTrailing) {
            if let productHasTrial = product.introductoryDiscount{
                Text("Save %50")
                    .customFont(size: 12, design: .RubikBold)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color.mainGreenColor)
                    .cornersRadius(radius: 14, corners: [.topRight,.bottomLeft])
            }
        }
    }
}

#Preview {
    ProductButton(product: products.last!, paywallProduct: PaywallProductController())
}
