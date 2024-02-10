//
//  CategoriesModel.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import Foundation

struct PlantCategory: Codable, Hashable {
    let data: [PlantData]
    let meta: Meta

    struct Meta: Codable , Hashable {
        struct Pagination: Codable , Hashable {
            let page: Int
            let pageSize: Int
            let pageCount: Int
            let total: Int
        }

        let pagination: Pagination
    }
}

struct PlantData: Codable , Hashable {
    struct PlantImage: Codable , Hashable {
        let id: Int
        let name: String
        let alternativeText: String?
        let caption: String?
        let width: Int
        let height: Int
        let formats: String?
        let hash: String
        let ext: String
        let mime: String
        let size: Double
        let url: String
        let previewUrl: String?
        let provider: String
        let providerMetadata: String?
        let createdAt: String
        let updatedAt: String
    }

    let id: Int
    let name: String
    let createdAt: String
    let updatedAt: String
    let publishedAt: String
    let title: String
    let rank: Int
    let image: PlantImage
}
