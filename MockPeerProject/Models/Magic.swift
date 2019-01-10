//
//  Magic.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

struct MagicCards: Codable{
    var cards: [Magic]
}

struct Magic : Codable {
    var name: String?
    var imageUrl: String?
    var text: String?
    var foreignNames: [ForeignNames]?
}

struct ForeignNames : Codable{
    var name: String?
    var text: String?
    var imageUrl: String?
    var language: String?
}
