//
//  ShoesService.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

import Foundation

class ShoesService {
    func getShoes(completion: @escaping ([GenderShoes]?, String?) -> Void) {
        let url = "https://sugary-wool-penguin.glitch.me/shoes?"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if success, let data = data {
                do {
                    // Decodifica directamente a un arreglo de GenderShoes
                    let shoes = try JSONDecoder().decode([GenderShoes].self, from: data)
                    completion(shoes, nil)
                } catch let error {
                    completion(nil, "Error al decodificar: \(error.localizedDescription)")
                }
            } else {
                completion(nil, message ?? "Error desconocido")
            }
        }
    }
}
