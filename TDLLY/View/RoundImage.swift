//
//  RoundImage.swift
//  htchhkr
//
//  Created by farido on 12/26/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView () {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
