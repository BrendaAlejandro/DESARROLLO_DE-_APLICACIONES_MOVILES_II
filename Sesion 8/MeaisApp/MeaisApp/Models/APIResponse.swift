//
//  APIResponse.swift
//  MeaisApp
//
//  Created by DAMII on 19/11/24.
//

import Foundation

// Estructura para la respuesta principal del API
struct APIResponse: Decodable {
    let categories: [Category]

    enum CodingKeys: String, CodingKey {
        case categories
    }
}

// Estructura para cada categoría dentro de la respuesta
struct Category: Decodable ,Identifiable {
    let id: String
    let name: String
    let image: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
