//
//  ShoesListViewModel.swift
//  EazyShoes
//
//  Created by DAMII on 10/12/24.
//

import Foundation

class ShoesListViewModel: ObservableObject {
    @Published var shoes: [GenderShoes] = []
    @Published var favorites: [GenderShoes] = [] // Lista de favoritos
    
    // Obtener zapatos por categoría
    func getShoes(for category: String) {
        let urlString: String
        switch category {
        case "WOMEN":
            urlString = "https://sugary-wool-penguin.glitch.me/shoes?gender=WOMEN"
        case "MEN":
            urlString = "https://sugary-wool-penguin.glitch.me/shoes?gender=MEN"
        case "KIDS":
            urlString = "https://sugary-wool-penguin.glitch.me/shoes?gender=KIDS"
        default:
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedShoes = try JSONDecoder().decode([GenderShoes].self, from: data)
                    DispatchQueue.main.async {
                        self.shoes = decodedShoes
                        // Actualizar la lista de favoritos
                        self.favorites = decodedShoes.filter { $0.isFavorite }
                    }
                } catch {
                    print("Error al decodificar JSON: \(error)")
                }
            }
        }.resume()
    }

    // Cambiar estado de favorito
    func toggleFavorite(shoe: GenderShoes) {
        if let index = shoes.firstIndex(where: { $0.id == shoe.id }) {
            shoes[index].isFavorite.toggle()
            if shoes[index].isFavorite {
                favorites.append(shoes[index])
            } else {
                favorites.removeAll { $0.id == shoe.id }
            }
        }
    }

    // Eliminar de favoritos
    func removeFavorite(shoe: GenderShoes) {
        if let index = favorites.firstIndex(where: { $0.id == shoe.id }) {
            favorites.remove(at: index)
        }
        
        // También puedes eliminar el estado de favorito de los zapatos en la lista principal si lo deseas
        if let index = shoes.firstIndex(where: { $0.id == shoe.id }) {
            shoes[index].isFavorite = false
        }
    }
}

