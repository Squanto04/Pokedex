//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jordan Lamb on 10/1/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case abilities
        case name
        case id
        case spriteDictionary = "sprites"
    }
    
    let name: String
    let id: Int
    let spriteDictionary: SpriteDictionary
    let abilities: [AbilitiesDictionary]
}

struct SpriteDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
    let image: URL
}

struct AbilitiesDictionary: Decodable {
    let ability: Ability
}

struct Ability: Decodable {
    let name: String
}
