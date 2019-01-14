//
//  API+contectUs.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_contectUs: NSObject {
    
    
    class func message(userName: String, email: String,message:String,subject:String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        guard let user_token = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        let url = URLs.message
        let parameters = [
            "user_name": userName,
            "email": email,
            "subject": message,
            "message": subject,
            "user_token": user_token
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let data = json["data"]["message"].string {
                    print(data)
                    completion(nil, true, data)
                }else {
                    let data = json["data"].string
                        print(data ?? "" )
                        completion(nil, true, data)
                }
                
            }
        }
        
    }
    
    class func termes(completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ des: String?)->Void) {
        
        let api_token = "1111"
        let lang = "ar"
        let type = "terms and conditions"
        
        let url = URLs.contactUs
        let parameters = [
            "api_token": api_token,
            "lang": lang,
            "type": type
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let data = json["data"]["name"].string {
                    print(data)
                    let des = json["data"]["description"].string
                    print(des ?? "")
                    completion(nil, true, data, des)
                }
                
            }
        }
        
    }
    
    class func profile(completion: @escaping (_ error: Error?, _ success: Bool, _ name: String?,_ username: String?,_ email: String?,_ phone: String?,_ address: String?,_ image: String?)->Void) {
        guard let user_token = helper.getAPIToken() else {
            completion(nil,false,nil,nil,nil,nil,nil,nil)
            return
        }
        let url = URLs.getProfile
        let parameters = [
            "user_token": user_token
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,nil,nil,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let name = json["data"]["name"].string {
                    let username = json["data"]["username"].string
                    let email = json["data"]["email"].string
                    let phone = json["data"]["phone"].string
                    let address = json["data"]["address"].string
                    let image = json["data"]["image"].string
                    completion(nil, true, name,username,email,phone,address,image)
                }
                
            }
        }
        
    }
}
