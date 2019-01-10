//
//  MagicDetailVC.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class MagicDetailVC: UIViewController {

    
    var magic: Magic?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }


    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension MagicDetailVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (magic?.foreignNames.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetailCell", for: indexPath) as? MagicDetailCell else {return UICollectionViewCell() }
        
        
        if let magi = magic?.foreignNames[indexPath.row]{
            ImageHelper.shared.fetchImage(urlString: (magic?.imageUrl) ?? "no url", completionHandler: { (error, image) in
                
                if let error = error {
                    print("\(error)")
                }
                
                if let image = image {
                    cell.magicPhoto.image = image
                }
                cell.langauge.text = magi.language
                cell.magicDescription.text = magi.text
                cell.name.text = magi.name
            })
            
        }
        return cell
    }
}


extension MagicDetailVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
