//
//  catCell.swift
//  TDLLY
//
//  Created by farido on 1/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class catCell: UICollectionViewCell {
    
    @IBOutlet weak var image: RoundImage!
    @IBOutlet weak var catName: UILabel!
    
    func configuerCell(prodect: categoury) {
        
        catName.text = prodect.name
        image.image = UIImage(named: "3")
        let s = (URLs.mainImage + prodect.image)
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
