//
//  loginVC.swift
//  TDLLY
//
//  Created by farido on 1/3/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageText()
    }
    

   
    func imageText() {
        
        if let myImage = UIImage(named: "Shape"){
            
            userNameTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "lock-ico"){
            
            passwordTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
}
