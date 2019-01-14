//
//  ads.swift
//  TDLLY
//
//  Created by farido on 1/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ads: NSObject {
    
    class func Addad(name_ad: String, address: String, category_id: String,sub_category_id: String,price: String ,type_ad: String,phone: String,description: String,location: String,image: UIImage, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        
        guard let user_token = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        
        let url = URLs.addAds+"?user_token=\(user_token.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? user_token)&name_ad=\(name_ad.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? name_ad)&address=\(address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? address)&category_id=\(category_id.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? category_id)&sub_category_id=\(sub_category_id.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? sub_category_id)&price=\(price.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? price)&type_ad=\(type_ad.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? type_ad)&phone=\(phone.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? phone)&description=\(description.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? description)&location=\(location.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? location)"
        
        
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
                        if let data = json["data"]["message"].string {
                            print(data)
                            completion(nil, true, data)
                        }
                        
                    }
                })
            }
        }
    }
    class func myadds(completion: @escaping (_ error: Error?,_ sparParts: [myAdds]?)-> Void) {
        
        let url = URLs.myAdds
        
        guard let user_token = helper.getAPIToken() else {
            completion(nil,nil)
            return
        }
        
        let type = "now"
        
        let parameters: [String: Any] = [
            "user_token": user_token,
            "type": type
        ]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [myAdds]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myAdds.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}

//myAdds
