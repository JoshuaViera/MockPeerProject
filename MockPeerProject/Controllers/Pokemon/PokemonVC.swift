//
//  PokemonVC.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class PokemonVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myPokemon = [Pokemon](){
        didSet{
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        PokemonAPIClient.getPokemon { (error, pokemon) in
            
            if let error = error {
                print(error)
            }
            if let pokemon = pokemon {
                self.myPokemon = pokemon
//                print(pokemon.count)
            }
        }
    }
    
    
}
extension PokemonVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell else {return UICollectionViewCell()}
        
        ImageHelper.shared.fetchImage(urlString: myPokemon[indexPath.row].imageUrl) { (error, image) in
            if let error = error{
                print("\(error)")
            }
            if let image = image {
                 cell.pokemonImage.image = image
            }
        } 
        return cell
    }
}

extension PokemonVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 120, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetailVC = storyboard.instantiateViewController(withIdentifier: "Pokemon") as! PokemonDetailVC
        DetailVC.pokemon = myPokemon[indexPath.row]
        DetailVC.modalTransitionStyle = .crossDissolve
        DetailVC.modalPresentationStyle = .overCurrentContext
        self.present(DetailVC, animated: true, completion: nil)
    }
}

