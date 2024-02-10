//
//  WelcomePage.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import SwiftUI

struct WelcomePage : View{
    @Binding var selection : Int
    var body: some View{
        VStack{
            HStack{
                VStack(alignment : .leading, spacing: 10){
                    buildCustomText([
                        ("Welcome to ", 28,  .RubikRegular),
                        ("PlantApp", 28, .RubikBold)
                    ])
                    .foregroundStyle(Color.mainTextColor)
                    
                    Text("Identify more than 3000+ plants and 88% accuracy.")
                        .customFont(size: 16, design: .RubikRegular)
                        .foregroundStyle(.gray)
                        .kerning(0.07)
                }
                Spacer()
            }.padding(.horizontal,20)
            VStack{
                Image("onboarding-welcome")
                    .resizable()
                    .scaledToFit()
                Button(action: {
                    selection += 1
                    
                }, label: {
                    Text("Get Started")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                })
                .buttonStyle(PlantAppButtonStyle(buttonColor: .mainGreenColor))
                .padding(.horizontal, 20)
                .padding(.vertical)
                VStack(alignment : .center){
                    Text("By tapping next, you are agreeing to PlantID")
                        .customFont(size: 11, design: .RubikRegular)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black.opacity(0.3))
                        
                    HStack(alignment : .center, spacing: 2){
                        Link(destination: URL(string: "https://www.apple.com")!, label: {
                            Text("Terms of Use")
                                .underline()
                                .customFont(size: 11, design: .RubikRegular)
                        })
                        Text("&")
                            .customFont(size: 11, design: .RubikRegular)
                        Link(destination: URL(string: "https://www.apple.com")!, label: {
                            Text("Privacy Policy.")
                                .underline()
                                .customFont(size: 11, design: .RubikRegular)
                        })
                    }
                    .foregroundStyle(.black.opacity(0.3))
                }
                .padding(.bottom,28)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .background(
            Image("onboarding-background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}


#Preview {
    WelcomePage(selection: .constant(0))
}
