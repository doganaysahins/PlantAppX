//
//  FeaturesInfo.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 9.02.2024.
//

import Foundation

/**
 Dummy product specification, assumed to come from any service, like Remote Config
**/

var premiumFeatures : [Feature] = [
    Feature(featureImage: "unlimited", featureTitle: "Unlimited", featureSubtitle: "Plant Identify"),
    Feature(featureImage: "faster", featureTitle: "Faster", featureSubtitle: "Process"),
    Feature(featureImage: "unlimited", featureTitle: "Unlimited", featureSubtitle: "Plant Identify"),
    Feature(featureImage: "faster", featureTitle: "Faster", featureSubtitle: "Process"),
    Feature(featureImage: "unlimited", featureTitle: "Unlimited", featureSubtitle: "Plant Identify"),
]

struct Feature : Hashable{
    var id : String = UUID().uuidString
    var featureImage : String
    var featureTitle : String
    var featureSubtitle : String
}
