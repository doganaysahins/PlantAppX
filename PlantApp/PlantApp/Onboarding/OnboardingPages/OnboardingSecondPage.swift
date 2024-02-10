//
//  OnboardingSecondPage.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import SwiftUI

struct OnboardingSecondPage: View {
    @Binding var selection : Int
    var body: some View {
        VStack{
            HStack{
                VStack(alignment : .leading){
                    buildCustomText([
                        ("Get Plant ", 28,  .RubikMedium),
                        ("care guides ", 28, .RubikExtraBold),
                    ])
                    .overlay(alignment: .center) {
                        Image("brush")
                            .padding(.top,4)
                            .offset(x : 64, y: 24)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
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
            }.padding(.bottom, 40)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            ZStack(alignment: .center){
                Image("blured-leaves")
                    .resizable()
            }
                .overlay(alignment : .bottom){
                    VStack{
                        Image("flat-iphone")
                            .overlay(alignment: .top) {
                                Image("Artwork")
                                    .offset(y : -52)
                            }
                            .padding(.bottom, 68)
                            .overlay(alignment: .bottom) {
                                Image("onboarding-overlay")
                            }
                    }
                }
        )
    }
}

#Preview {
    OnboardingSecondPage(selection: .constant(2))
}
