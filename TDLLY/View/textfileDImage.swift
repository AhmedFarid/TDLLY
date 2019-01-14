//
//  textfileDImage.swift
//  Dolphin
//
//  Created by farido on 12/18/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedBtton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}

