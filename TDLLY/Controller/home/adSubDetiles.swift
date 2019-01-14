//
//  adSubDetiles.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class adSubDetiles: UIViewController {

    var singleItem: subCatsDatas?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var naem2: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        image.image = UIImage(named: "3")
        let s = "\(URLs.mainImage)upload/ad/\(singleItem?.image ?? "")"
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        name.text = singleItem?.name
        des.text = singleItem?.des
        naem2.text = singleItem?.name
        price.text = "\(singleItem?.price ?? "") ريال"
        date.text = singleItem?.date
        status.text = singleItem?.type_ad
        address.text = singleItem?.address
    }
    
    @IBAction func phoneCall(_ sender: Any) {
        if let url = URL(string:"tel://\(singleItem?.phone ?? "")"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
