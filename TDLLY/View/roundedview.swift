//
//  roundedview.swift
//  TDLLY
//
//  Created by farido on 1/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

@IBDesignable
class roundedview: UIView {
    
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
