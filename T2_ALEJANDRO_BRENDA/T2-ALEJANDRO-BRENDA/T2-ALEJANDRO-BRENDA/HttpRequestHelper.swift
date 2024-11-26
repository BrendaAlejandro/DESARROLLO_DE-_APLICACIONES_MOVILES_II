//
//  HttpRequestHelper.swift
//  T2-ALEJANDRO-BRENDA
//
//  Created by DAMII on 26/11/24.
//

import Foundation

class HttpRequestHelper {
    func GET(url: String, completion: @escaping (Bool, Data?, String?) -> Void) {
            guard let url = URL(string: url) else {
                completion(false, nil, "Error: Invalid URL")
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(false, nil, "Error: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    completion(false, nil, "Error: Invalid response from server")
                    return
                }
                
                guard let data = data else {
                    completion(false, nil, "Error: No data received")
                    return
                }
                
                completion(true, data, nil)
            }
            
            task.resume()
        }
}
