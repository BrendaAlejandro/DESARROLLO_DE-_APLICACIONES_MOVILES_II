//
//  GenderShoes.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

import Foundation

struct GenderShoes: Identifiable, Decodable {
    let id: Int32
    let name: String
    let brand: String
    let gender: String
    let category: String
    let image: String
    let price: Double
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case brand = "brand"
        case gender = "gender"
        case category = "category"
        case image = "image"
        case price = "price"
    }
}

