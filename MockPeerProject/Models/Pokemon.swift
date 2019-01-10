//
//  Pokemon.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

struct PokemonCards: Codable {
    var cards: [Pokemon]
}

struct Pokemon : Codable {
    var imageUrl: String
    var imageUrlHiRes: String
    var attacks: [AttackWrapper]
}

struct AttackWrapper: Codable {
    var name: String?
    var damage: String?
    var text: String?
}
