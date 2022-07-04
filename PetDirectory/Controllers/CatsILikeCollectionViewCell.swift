//
//  CatsILikeCollectionViewCell.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import UIKit

class CatsILikeCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CatsILikeCell"

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var likeCat: UIButton!
}
