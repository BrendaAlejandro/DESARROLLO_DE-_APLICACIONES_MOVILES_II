//
//  PeliculaListViewModel.swift
//  T2-ALEJANDRO-BRENDA
//
//  Created by DAMII on 26/11/24.
//

import Foundation

class PeliculaListViewModel: ObservableObject {
    @Published var peliculas: [Pelicula] = []
    
    // Esta función obtiene las películas de la API y las carga en el modelo
    func obtenerPeliculas() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=3cae426b920b29ed2fb1c0749f258325"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    // Decodificar la respuesta JSON
                    let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.peliculas = decodedResponse.results
                    }
                } catch {
                    print("Error al decodificar los datos: \(error)")
                }
            }
        }.resume()
    }
}


