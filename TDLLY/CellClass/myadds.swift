//
//  myadds.swift
//  TDLLY
//
//  Created by farido on 1/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myadds: UITableViewCell {
    
    @IBOutlet weak var imagess: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var subcat: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    func configuerCell(prodect: myAdds) {
        name.text = "اسم الاعلان: \(prodect.nameAd)"
        price.text = "سعر الاعلان:\(prodect.price)"
        subcat.text = "القسم: \(prodect.subCategoryName)- الفرع:\(prodect.categoryName)"
        status.text = prodect.type_ad
        
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
