//
//  QuestionsViewModel.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import Foundation

/**
 A view model class for managing questions data and fetching questions from a remote API using the `NetworkService`.

 This class conforms to the `ObservableObject` protocol to allow SwiftUI views to observe and react to changes in the `questions` property.

 Example usage:

 ```swift
 // Create an instance of the QuestionsViewModel.
 let questionsViewModel = QuestionsViewModel()

 // Fetch questions from the remote API.
 questionsViewModel.getQuestions()

**/

class QuestionsViewModel : ObservableObject{
    @Published var questions : [Questions] = []
    
    func getQuestions(){
        NetworkService<[Questions]>.shared.sendRequest(for: .getQuestions) {  [weak self] categoriesResult in
            switch categoriesResult {
            case .success(let questionData):
                guard let self = self else {return}
                DispatchQueue.main.async {
                    self.questions = questionData
                }
            case .failure(let failure):
                print("Questions Failed" + failure.rawValue)
            }
        }
    }
}
