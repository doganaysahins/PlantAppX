//
//  OnboardingController.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import Foundation

/**
 A controller class to manage onboarding status using the `ObservableObject` protocol.

 This class is responsible for handling the onboarding state, and it uses the `@Published` property wrapper to automatically update any SwiftUI views observing the `onboarded` property.

 - Note: The onboarding status is stored in the user defaults with the key "isOnboarded".

 Example usage:

 ```swift
 // Create an instance of the OnboardingController
 let onboardingController = OnboardingController()

 // Access the onboarding status
 let isOnboarded = onboardingController.onboarded

 // Set the onboarding status
 onboardingController.onboarded = true
**/

class OnboardingController : ObservableObject {
    @Published var onboarded: Bool {
        didSet {
            UserDefaults.standard.set(onboarded, forKey: "isOnboarded")
        }
    }
    init() {
        _onboarded = .init(initialValue: UserDefaults.standard.bool(forKey: "isOnboarded"))
    }
}
