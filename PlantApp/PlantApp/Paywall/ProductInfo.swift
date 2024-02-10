//
//  ProductInfo.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import Foundation

/**
 Dummy products and model prepared as coming from any service.
 **/
var products : [ProductInfo] = [
    ProductInfo(
        id: "1",
        priceString: "$2.99",
        period: "Month",
        unit: .month,
        localizedTitle: "Month",
        introductoryDiscount: nil),
    ProductInfo(
        id: "2",
        priceString: "$529,99",
        period: "Year",
        unit: .year,
        localizedTitle: "Year",
        introductoryDiscount:
            IntroductoryDiscountModel(
                localizedPeriod: "3 days",
                localizedPrice: "529,99",
                paymentMode: "",
                localizedTitle: "Yearly"))
    
]

struct ProductInfo : Hashable{
    let id : String
    let priceString : String
    let period : String
    let unit : ProductInfo.ProductUnits
    let localizedTitle : String
    let introductoryDiscount: IntroductoryDiscountModel?
   
    enum ProductUnits{
        case day
        case week
        case month
        case year
        case unknown
    }
}

struct IntroductoryDiscountModel: Hashable {
    let localizedPeriod: String
    let localizedPrice: String
    let paymentMode: String
    let localizedTitle : String
    
}
