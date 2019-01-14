//
//  muneBtn.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class muneBtn: UIViewController {
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    @IBAction func logOut(_ sender: Any) {
        helper.dleteAPIToken()
    }
}
