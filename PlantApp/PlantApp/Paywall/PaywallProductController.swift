//
//  PaywallProductController.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import Foundation
/**
 A controller class to manage paywall products simultaniusly and their trial information using the `ObservableObject` protocol.

 This class provides functionality to handle selected paywall products and generate trial information based on the selected product's properties.

 - Note: The selected product is published to automatically update any SwiftUI views observing the `selectedProduct` property.

 Example usage:

 ```swift
 // Create an instance of the PaywallProductController
 let paywallController = PaywallProductController()

 // Access the selected product
 let selectedProduct = paywallController.selectedProduct

 // Set a new selected product
 paywallController.selectedProduct = newProduct
**/

class PaywallProductController : ObservableObject{
    @Published var selectedProduct : ProductInfo? = products.last
    
    func trialNew(products : ProductInfo) -> String{
        if let freeTrialisOn = products.introductoryDiscount {
            return "First " + freeTrialisOn.localizedPeriod.lowercased() + " free, then " + products.priceString + "/" + unitStringPeriod(unit: products.unit).lowercased()
        }else{
            return products.priceString + "/" + unitStringPeriod(unit: products.unit).lowercased() + ", auto renewable"
        }
    }

    func unitStringPeriod(unit : ProductInfo.ProductUnits) -> String {
       switch unit {
       case .day:
           return "Week"
       case .week:
           return "Week"
       case .month:
           return "Month"
       case .year:
           return "Year"
       case .unknown:
           return "nil"
       }
   }
}
