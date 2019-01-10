//
//  PokemonCell.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    
    override func prepareForReuse() {
        pokemonImage.image = nil 
    }
}
