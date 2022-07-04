//
//  AllCatsTableViewCell.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import UIKit

protocol AllCatsTableViewCellDelegate {
    func tappedLike(data: CatModel?)
}

class AllCatsTableViewCell: UITableViewCell {

    static let identifier: String = "AllCatsCell"

    var delegate: AllCatsTableViewCellDelegate?
    var likedCatInfo: CatModel?

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var likeCat: UIButton!
    
    

    @IBAction func tappedLike(_ sender: UIButton) {
        delegate?.tappedLike(data: likedCatInfo!)
        likeCat.setImage(UIImage(named: "Liked"), for: .normal)
    }
}
