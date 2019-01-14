//
//  contactUsVC.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class contactUsVC: UIViewController {

    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var messageTV: RoundeTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText()
    }
    
    

    @IBAction func sendBtn(_ sender: Any) {
        
        
        guard let userNames = userName.text, !userNames.isEmpty else {
            let messages = NSLocalizedString("enter your user name", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = phone.text, !phones.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let emails = email.text, !emails.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let subjects = subject.text, !subjects.isEmpty else {
            let messages = NSLocalizedString("enter massage subject", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
    
        
        API_contectUs.message(userName: userNames,email: emails, message: messageTV.text ?? "", subject: subjects) { (error: Error?, success: Bool, data) in
            if success {
                self.showAlert(title: "message", message: "\(data ?? "") ")
            }else {
                self.showAlert(title: "message", message: "\(data ?? "") ")
            }
            
        }
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "userBlack"){
            
            userName.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "call-answer"){
            
            phone.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "close-envelope"){
            
            email.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "edit"){
            
            subject.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
}
