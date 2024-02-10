//
//  QuestionsModel.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import Foundation

struct Questions: Codable {
    let id: Int
    let title, subtitle: String
    let image_uri: String
    let uri: String
    let order: Int
}
