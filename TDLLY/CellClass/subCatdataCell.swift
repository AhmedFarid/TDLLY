//
//  subCatdataCell.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class subCatdataCell: UITableViewCell {

    
    @IBOutlet weak var imagess: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func configuerCell(prodect: subCatsDatas) {
        
        date.text = prodect.date
        address.text = prodect.address
        status.text = prodect.type_ad
        price.text = "\(prodect.price) ريال"
        name.text = prodect.name
        imagess.image = UIImage(named: "3")
        let s = (URLs.mainImage + "upload/ad/" + prodect.image)
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        imagess.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            imagess.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
