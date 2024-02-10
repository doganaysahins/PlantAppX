//
//  PlantAppApp.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 7.02.2024.
//

import SwiftUI

@main
struct PlantAppApp: App {
    @ObservedObject var questionViewModel = QuestionsViewModel()
    @ObservedObject var categoriesViewModel = CategoriesViewModel()
    @ObservedObject var onboarding = OnboardingController()

    var body: some Scene {
        WindowGroup {
            ContentView(questionViewModel: questionViewModel, categoriesViewModel: categoriesViewModel, onboarding : onboarding)
                .task {
                    questionViewModel.getQuestions()
                    categoriesViewModel.getCategories()
                }
        }
    }
}
