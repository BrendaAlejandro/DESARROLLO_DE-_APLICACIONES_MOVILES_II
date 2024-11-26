//
//  APIResponse.swift
//  T2-ALEJANDRO-BRENDA
//
//  Created by DAMII on 26/11/24.
//

import Foundation

// Modelo para representar la respuesta completa de la API
struct APIResponse: Decodable {
    let page: Int
    let results: [Pelicula]
}

// Modelo para representar una película individual
struct Pelicula: Identifiable, Decodable {
    let id: Int
    let title: String
    let original_title: String
    let overview: String
    let release_date: String
    let poster_path: String
    let backdrop_path: String
    let vote_average: Double
    let vote_count: Int
    let genre_ids: [Int]
    let popularity: Double
    let adult: Bool
    let original_language: String
    let video: Bool
}

// Aquí se hace la decodificación de la respuesta
struct PeliculasResponse: Decodable {
    let results: [Pelicula]
}
