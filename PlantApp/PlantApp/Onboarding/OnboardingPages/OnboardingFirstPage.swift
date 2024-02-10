//
//  OnboardingFirstPage.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import SwiftUI

struct OnboardingFirstPage: View {
    @Binding var selection : Int
    var body: some View {
        VStack{
            VStack(alignment : .leading){
                buildCustomText([
                    ("Take a photo to ", 28,  .RubikMedium),
                    ("identify ", 28, .RubikExtraBold),
                    ("the plant", 28, .RubikMedium)
                ])
                .foregroundStyle(Color.mainTextColor)
                .overlay(alignment: .center) {
                    Image("brush")
                        .padding(.top,4)
                        .offset(x : 94)
                }
            }
            Spacer()
            VStack{
                Spacer()
                Button(action: {
                    selection += 1
                }, label: {
                    Text("Continue")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                })
                .buttonStyle(PlantAppButtonStyle(buttonColor: .mainGreenColor))
                .padding(.horizontal, 20)
                .padding(.vertical)
                HStack{
                    tabCircle(for: 1, selection: selection)
                    tabCircle(for: 2, selection: selection)
                    tabCircle(for: 3, selection: selection)
                }
            }.padding(.bottom,40)
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(
            VStack{
                Image("onboarding-background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(alignment: .bottom, content: {
                        VStack{
                            Spacer()
                            Image("onboarding-1")
                                .resizable()
                                .scaledToFit()
                                .edgesIgnoringSafeArea(.bottom)
                        }
                    })
            }
        )
    }
}

#Preview {
    OnboardingFirstPage(selection: .constant(1))
}
