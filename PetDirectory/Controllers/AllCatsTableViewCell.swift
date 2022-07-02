//
//  AllCatsTableViewCell.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import UIKit

class AllCatsTableViewCell: UITableViewCell {
    static let identifier: String = "AllCatsCell"

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var likeCat: UIButton!
    
}
