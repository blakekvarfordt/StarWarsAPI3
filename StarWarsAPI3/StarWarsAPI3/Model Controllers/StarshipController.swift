//
//  StarshipController.swift
//  StarWarsAPI3
//
//  Created by Blake kvarfordt on 10/3/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

class StarshipController {
    
    let baseURL = URL(string: StarshipConstants.baseURL)
    
    func getDaStarships(with searchTerm: String, completion: @escaping ([Starship]) -> Void ) {
        
        guard let url = baseURL else { completion([]); return }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let queryItem = URLQueryItem(name: StarshipConstants.queryItem1, value: searchTerm)
        
        urlComponents?.queryItems = [queryItem]
        
        guard let finalURL = urlComponents?.url else { completion([]); return }
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            if let error = error {
                print("Error", error.localizedDescription)
            }
            
            guard let data = data else { completion ([]); return }
            
            do {
                let decodedwhatever = try JSONDecoder().decode(TopLevelDict.self, from: data)
                completion(decodedwhatever.starships)
            } catch {
                completion([])
            }
        }; dataTask.resume()
    }
}
