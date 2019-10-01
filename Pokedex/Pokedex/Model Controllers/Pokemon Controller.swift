//
//  Pokemon Controller.swift
//  Pokedex
//
//  Created by Jordan Lamb on 10/1/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation
import UIKit

class PokemonController {
    
    static func fetchPokemon (with searchTerm: String, completion: @escaping (TopLevelDictionary?) -> Void) {
        
        // Step One
        guard let baseURL = URL(string: "https://pokeapi.co/api/v2") else { return }
        // Add the first additional component (pokemon)
        let pokemonComponent = baseURL.appendingPathComponent("pokemon")
        // Add the second additional component (Pokemon ID)
        let finalURL = pokemonComponent.appendingPathComponent(searchTerm)
        print(finalURL)
        // Perform the dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // Check for error
            if let error = error {
                print("Error performaing the dataTask: \(error.localizedDescription)")
            }
            // Check for data
            if let data = data {
                // If I can create a constant from the value of the data returned in the dataTask completion - then there is data to work with.
                do {
                    let pokemon = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                completion(pokemon)
                } catch {
                    print("Error decoding the data into our Pokemon Object \(error.localizedDescription)")
                    completion(nil); return
                }
            }
        }
        dataTask.resume()
    }
    
    
    static func getImage(pokemon: TopLevelDictionary, completion: @escaping (UIImage?) -> Void) {
        let finalURL = pokemon.spriteDictionary.image
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error with the image: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
        }
        dataTask.resume()
    }
    
} // End of Class
