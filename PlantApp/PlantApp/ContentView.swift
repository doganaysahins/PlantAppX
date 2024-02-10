//
//  ContentView.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 7.02.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var questionViewModel : QuestionsViewModel
    @ObservedObject var categoriesViewModel : CategoriesViewModel
    @ObservedObject var onboarding : OnboardingController
    var body: some View {
        
        if onboarding.onboarded{
            TabbarView(questionViewModel: questionViewModel, categoriesViewModel: categoriesViewModel)
                .ignoresSafeArea(.keyboard)
        }else{
            OnboardingView(onboarding: onboarding)
               
        }
        
    }
}

#Preview {
    ContentView(questionViewModel: QuestionsViewModel(), categoriesViewModel: CategoriesViewModel(), onboarding: OnboardingController())
}
