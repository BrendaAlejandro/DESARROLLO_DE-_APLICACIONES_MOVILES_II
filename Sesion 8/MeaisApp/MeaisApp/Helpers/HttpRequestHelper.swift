//
//  HttpRequestHelper.swift
//  MeaisApp
//
//  Created by DAMII on 19/11/24.
//

import Foundation

class HttpRequestHelper {

    // Método GET con un closure de completion
    func GET(url: String, completion: @escaping (Bool, Data?, String?) -> Void) {
        
        // Verificar si la URL es válida
        guard let url = URL(string: url) else {
            completion(false, nil, "Error: URL cannot be created")
            return
        }
        
        // Crear la solicitud GET
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        // Iniciar la sesión de red
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            
            // Verificar si hubo un error
            guard error == nil else {
                completion(false, nil, "Error: Problem calling GET")
                return
            }

            // Verificar si la respuesta HTTP tiene el código de estado 200 (OK)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(false, nil, "Error: HTTP request failed")
                return
            }

            // Verificar si hay datos
            guard let data = data else {
                completion(false, nil, "Error: No data")
                return
            }

            // Llamar a completion con éxito
            completion(true, data, nil)
            
        }.resume() // Iniciar la tarea de red
    }
}

