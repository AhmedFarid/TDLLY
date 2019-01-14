//
//  profileVC.swift
//  TDLLY
//
//  Created by farido on 1/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class profileVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    
    var images = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDat()
        
        
    }
    
    func getDat() {
        API_contectUs.profile { (error: Error?, success: Bool, name,username,email,phone,address,image)  in
            if success {
                self.name.text = name
                self.userName.text = username
                self.email.text = email
                self.phone.text = phone
                self.address.text = address
                self.images = image ?? ""
                
                self.image.image = UIImage(named: "3")
                let s = ("http://alofk.com/tdlly\(image ?? "")")
                let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
                let encodedURL = NSURL(string: encodedLink!)! as URL
                
                self.image.kf.indicatorType = .activity
                if let url = URL(string: "\(encodedURL)") {
                    print("g\(url)")
                    self.image.kf.setImage(with: url)
                    //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
                }
            }else {
            }
            
        }
    }
}
