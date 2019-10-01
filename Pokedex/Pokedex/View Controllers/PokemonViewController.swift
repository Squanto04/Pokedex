//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Jordan Lamb on 10/1/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonId: UILabel!
    @IBOutlet weak var pokemonAbility: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func updateViews(pokemon: TopLevelDictionary, image: UIImage) {
        DispatchQueue.main.async {
            self.pokemonName.text = pokemon.name
            self.pokemonId.text = "\(pokemon.id)"
            self.pokemonAbility.text = pokemon.abilities[0].ability.name
            self.pokemonImageView.image = image
        }
    }
    
} // End of Class

extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        PokemonController.fetchPokemon(with: searchText) { (pokemon) in
            guard let pokemon = pokemon else { return }
            PokemonController.getImage(pokemon: pokemon, completion: { (image) in
                guard let image = image else { return }
                self.updateViews(pokemon: pokemon, image: image)
            })
        }
    }
}
