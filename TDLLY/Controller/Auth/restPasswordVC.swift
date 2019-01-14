//
//  restPasswordVC.swift
//  TDLLY
//
//  Created by farido on 1/3/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class restPasswordVC: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText()
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "Shape"){
            
            userNameTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "at-sign"){
            
            emailTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
}
