//
//  PaywallPage.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import SwiftUI

enum PaywallPresentState{
    case onboarding
    case fullScreen
}


struct PaywallPage: View {
    
    @StateObject var paywallProductController = PaywallProductController()
    @ObservedObject var onboarded : OnboardingController
    @State var paywallState : PaywallPresentState
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Spacer()
            HStack{
                VStack(alignment : .leading, spacing:10){
                    buildCustomText([
                        ("PlantApp ", 30, .RubikBold),
                        ("Premium", 27, .RubikLight),
                    ])
                    .foregroundStyle(.white)
                    Text("Access All Features")
                        .customFont(size: 17, design: .RubikLight)
                        .foregroundStyle(.white.opacity(0.7))
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            FeaturesView()
            VStack(spacing : 20){
                ForEach(products, id : \.self){ product in
                    ProductButton(product: product, paywallProduct: paywallProductController)
                        .onTapGesture {
                            paywallProductController.selectedProduct = product
                        }
                }
            }
            .padding(.horizontal, 20)
            Button(action: {
                
            }, label: {
                if let isSelectedProductHasTrial = paywallProductController.selectedProduct?.introductoryDiscount{
                    Text("Try free for " + isSelectedProductHasTrial.localizedPeriod)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }else{
                    Text("Continue")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            })
            .buttonStyle(PlantAppButtonStyle(buttonColor: .mainGreenColor))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            PaywallTerms()
        }
        .padding(.bottom, 25)
        .edgesIgnoringSafeArea(.bottom)
        .background(
            ZStack(alignment : .top){
                Color.paywallBackground.ignoresSafeArea()
                Image("paywall-image")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }
        )
        .overlay(alignment: .topTrailing) {
            Button(action: {
                switch paywallState {
                case .onboarding:
                    onboarded.onboarded.toggle()
                case .fullScreen:
                    presentationMode.wrappedValue.dismiss()
                }
                
            }, label: {
                Image("close-icon")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 20)
                
            })
        }
    }
}

#Preview {
    PaywallPage(onboarded: OnboardingController(), paywallState: .onboarding)
}




