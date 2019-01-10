//
//  MagicCell.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class MagicCell: UICollectionViewCell {
//

    @IBOutlet weak var magicPhoto: UIImageView!
    
    override func prepareForReuse() {
        magicPhoto.image = nil
    }
}
