//
//  CategoriesViewModel.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import Foundation
/**
 A view model class for managing plant categories data and fetching categories from a remote API using the `NetworkService`.

 This class conforms to the `ObservableObject` protocol to allow SwiftUI views to observe and react to changes in the `categories` and `searchText` properties.

 Example usage:

 ```swift
 // Create an instance of the CategoriesViewModel.
 let categoriesViewModel = CategoriesViewModel()

 // Fetch categories from the remote API.
 categoriesViewModel.getCategories()
**/

class CategoriesViewModel : ObservableObject{
    @Published var categories : [PlantData] = []
    @Published var searchText : String = ""
    
    var searchResults : [PlantData]{
        if searchText.isEmpty{
            return categories
        }else{
            return categories.filter{
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func getCategories(){
        NetworkService<PlantCategory>.shared.sendRequest(for: .getCategories) {  [weak self] categoriesResult in
            switch categoriesResult {
            case .success(let categoriesData):
                guard let self = self else {return}
                DispatchQueue.main.async {
                    self.categories = categoriesData.data
                    
                }
            case .failure(let failure):
                print("Categories Failed" + failure.rawValue)
            }
        }
    }
}
