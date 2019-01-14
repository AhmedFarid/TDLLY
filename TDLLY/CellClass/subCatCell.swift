//
//  subCatCell.swift
//  TDLLY
//
//  Created by farido on 1/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class subCatCell: UICollectionViewCell {
    
    @IBOutlet weak var subName: UILabel!
    
    func configuerCell(prodect: subCats) {
        
        subName.text = prodect.title
    }
    
}
