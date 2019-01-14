//
//  API+Auth.swift
//  TDLLY
//
//  Created by farido on 1/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class API_Login: NSObject {
    class func register(name: String, email: String, username: String,password: String,country: String ,city: String,phone: String,location: String,address: String,image: UIImage, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLs.register+"?api_token=1500&name=\(name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? name)&email=\(email.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? email)&username=\(username.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? username)&password=\(password.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? password)&country=\(country.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? country)&city=\(city.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? city)&phone=\(phone.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? phone)&location=\(location.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? location)&address=\(address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? address)"
        print(url)
//        let parameters = [
//            "api_token": api_token,
//            "name": name,
//            "email": email,
//            "username": username,
//            "password": password,
//            "country": country,
//            "city": city,
//            "phone":phone,
//            "location": location,
//            "address": address
//        ]
        
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            if let data = image.jpegData(compressionQuality: 0.5) {
                form.append(data, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: .post, headers: nil) { (result: SessionManager.MultipartFormDataEncodingResult) in
            switch result {
            case .failure(let error):
                print(error)
                completion(error,false,nil)
                
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.uploadProgress(closure: { (progress: Progress) in
                    print("farido\(progress)")
                })
                upload.responseJSON(completionHandler: { (response: DataResponse<Any>) in
                    switch response.result
                    {
                    case .failure(let error):
                        print(error)
                        completion(error,false,nil)
                        
                    case .success(let value):
                        let json = JSON(value)
                        print(value)
                        if let user_token = json["data"]["userToken"].string {
                            print("user token \(user_token)")
                            helper.saveAPIToken(token: user_token)
                            completion(nil, true , nil)
                        }else {
                            let data = json["data"].string
                            print(data ?? "no")
                            completion(nil, true, data)
                        }
                        
                    }
                })
            }
        }
        
    }
        
        
//        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
//            switch response.result
//            {
//            case .failure(let error):
//                completion(error, false, nil)
//                print(error)
//                //self.showAlert(title: "Error", message: "\(error)")
//
//            case .success(let value):
//                let json = JSON(value)
//                print(value)
//                if let user_token = json["data"]["userToken"].string {
//                    print("user token \(user_token)")
//                    helper.saveAPIToken(token: user_token)
//                    completion(nil, true , nil)
//                }else {
//                    let data = json["data"].string
//                    print(data ?? "no")
//                    completion(nil, true, data)
//                }
//
//            }
//        }
//
//    }

    class func login(userName: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let api_token = "123asd"
        let url = URLs.login
        let parameters = [
            "api_token": api_token,
            "username": userName,
            "password": password
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
                if let user_token = json["data"]["userToken"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true , nil)
                }else {
                    let data = json["data"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }
}
