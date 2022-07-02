//
//  Utility.swift
//  PetDirectory
//
//  Created by Decagon on 01/07/2022.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView{
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
}

class CustomTabBar : UITabBar {
    @IBInspectable var height: CGFloat = 0.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }
}
