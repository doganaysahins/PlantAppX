//
//  OnboardingView.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import SwiftUI



struct OnboardingView: View {
    @State var selection : Int = 0
    @ObservedObject var onboarding : OnboardingController
    var body: some View {
        VStack{
            TabView(selection: $selection) {
                WelcomePage(selection: $selection)
                    .tag(0)
                    .edgesIgnoringSafeArea(.bottom)
                OnboardingFirstPage(selection: $selection)
                    .tag(1)
                    .edgesIgnoringSafeArea(.bottom)
                
                OnboardingSecondPage(selection: $selection)
                    .tag(2).edgesIgnoringSafeArea(.bottom)
                PaywallPage(onboarded: onboarding, paywallState: .onboarding)
                    .tag(3)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

#Preview {
    OnboardingView(onboarding: OnboardingController())
}


