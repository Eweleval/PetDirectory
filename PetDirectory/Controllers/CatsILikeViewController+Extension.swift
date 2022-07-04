//
//  CaatsILikeViewController+Extension.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import Foundation
import UIKit

extension CatsILikeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfLikedCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatsILikeCollectionViewCell.identifier, for: indexPath) as?
                CatsILikeCollectionViewCell else { return UICollectionViewCell() }

        let liked = listOfLikedCats[indexPath.row]
        cell.catName.text = liked.name
        cell.catImage.image = UIImage(named: "catimage")

        return cell
    }
}
