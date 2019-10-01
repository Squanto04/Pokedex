//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jordan Lamb on 10/1/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

struct TopLevelDictionary {
    let name: String
    let id: Int
    let spriteDictionary: SpriteDictionary
    let abilityDictionary: [AbilityDictionary]
}

struct SpriteDictionary {
    let imageName: String
}

struct AbilityDictionary {
    let ability: Ability
}

struct Ability {
    let abilityName: String
    let abilityURL: String
}
