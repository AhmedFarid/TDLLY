//
//  termsVC.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class termsVC: UIViewController {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        API_contectUs.termes(completion: ){ (error: Error?, success: Bool, data, des) in
            if success {
                self.desc.text = des
                self.name.text = data
            }else {
                self.showAlert(title: "message", message: "\(data ?? "") ")
            }
            
        }
    }
}
