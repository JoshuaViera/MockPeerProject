//
//  MagicDetailCell.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/10/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class MagicDetailCell: UICollectionViewCell {
    @IBOutlet weak var magicPhoto: UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var langauge: UILabel!
    @IBOutlet weak var magicDescription: UITextView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
}
