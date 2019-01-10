//
//  PokemonDetailVC.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var pokemonPhoto: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func updateUI() {
        ImageHelper.shared.fetchImage(urlString: (pokemon?.imageUrl) ?? "no url", completionHandler: { (error, image) in
            
            if let error = error {
                print("\(error)")
            }
            
            if let image = image {
                self.pokemonPhoto.image = image
            }
        })
        
    }
    
    @IBAction func dimiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


extension PokemonDetailVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (pokemon?.attacks.count)!
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttackDetailCell", for: indexPath) as? AttackDetailCell else {return UICollectionViewCell() }
        
        cell.attackName.text = pokemon?.attacks[indexPath.row].name
        cell.attackPower.text = "\(pokemon?.attacks[indexPath.row].damage ?? "Nothing") "
        cell.attackDescription.text = "\(pokemon?.attacks[indexPath.row].text ?? "Error") "
        return cell
    }
}
extension PokemonDetailVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

