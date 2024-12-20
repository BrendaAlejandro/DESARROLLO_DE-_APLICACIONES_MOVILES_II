//
//  CategoryService.swift
//  MeaisApp
//
//  Created by DAMII on 19/11/24.
//

import Foundation

class CategoryService {
    
    
    func getCategories(completion: @escaping  ([Category]? ,String?) -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        HttpRequestHelper().GET(url: url) {success , data , mensage in
            
            if (success){
                guard let data = data else {
                    completion(nil, mensage ?? "Error : no data")
                    return
                }
                
                do {
                    let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                     completion(apiResponse.categories, nil)
                }catch let error {
                    completion(nil, "Error: \(error.localizedDescription) ")
                }
            } else{
                completion(nil , mensage ?? "Error: no response")
            }
        }
    }
}
