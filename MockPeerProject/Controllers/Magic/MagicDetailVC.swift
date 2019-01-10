//
//  MagicDetailVC.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class MagicDetailVC: UIViewController {
    
    @IBOutlet weak var magicPhoto: UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var langauge: UILabel!
    @IBOutlet weak var magicDescription: UITextView!
    
    var magic: Magic?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
