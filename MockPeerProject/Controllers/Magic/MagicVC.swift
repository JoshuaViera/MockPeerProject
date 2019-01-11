//
//  MagicVC.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class MagicVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var myMagic = [Magic](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        MagicAPIClient.getMagic { (error, magic) in
            if let error = error {
                print("Error:\(AppError.decodingError(error))")
            }
            if let magic = magic {
                self.myMagic = magic.filter{$0.imageUrl != nil}
            }
        }
    }
}
extension MagicVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myMagic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicCell", for: indexPath) as? MagicCell else {return UICollectionViewCell()}
        
        cell.loading.startAnimating()
        ImageHelper.shared.fetchImage(urlString: myMagic[indexPath.row].imageUrl ?? "") { (error, image) in
            if let error = error{
                print("\(error)")
            }
            if let image = image {
                
                cell.magicPhoto.image = image
                cell.loading.stopAnimating()
            }
        }
        return cell
    }
}

extension MagicVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 120, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetailVC = storyboard.instantiateViewController(withIdentifier: "Magic") as! MagicDetailVC
        DetailVC.magic = myMagic[indexPath.row]
        DetailVC.modalTransitionStyle = .crossDissolve
        DetailVC.modalPresentationStyle = .overCurrentContext
        self.present(DetailVC, animated: true, completion: nil)
    }
}
