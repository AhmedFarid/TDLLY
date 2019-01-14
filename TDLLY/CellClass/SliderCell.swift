//
//  SliderCell.swift
//  TDLLY
//
//  Created by farido on 1/4/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Kingfisher


class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configuerCell(prodect: Banners) {
        
        imageView.image = UIImage(named: "3")
        let s = (URLs.pannerIamge + prodect.img)
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        imageView.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            imageView.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
