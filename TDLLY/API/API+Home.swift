//
//  API+Home.swift
//  TDLLY
//
//  Created by farido on 1/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Home: NSObject {
    
    class func banner (completion: @escaping (_ error: Error?,_ sparParts: [Banners]?)-> Void) {
        let url = URLs.banners
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
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
                var products = [Banners]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = Banners.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func categour (completion: @escaping (_ error: Error?,_ sparParts: [categoury]?)-> Void) {
        
        let url = URLs.categories
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang
        ]
        
        
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
                var products = [categoury]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = categoury.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func Subcategour (category_id: String,completion: @escaping (_ error: Error?,_ sparParts: [subCats]?)-> Void) {
        
        let url = URLs.subCategories
        let api_token = "1234"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "category_id": category_id
        ]
        
        
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
                var products = [subCats]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = subCats.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    //subCatsDatas
    
    class func SubcategourData(sub_category_id: String,type: String,completion: @escaping (_ error: Error?,_ sparParts: [subCatsDatas]?)-> Void) {
        
        let url = URLs.adBySubCategories
        let parameters: [String: Any] = [
            "type": type,
            "sub_category_id": sub_category_id
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
                var products = [subCatsDatas]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = subCatsDatas.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func shearch(search: String,completion: @escaping (_ error: Error?,_ sparParts: [subCatsDatas]?)-> Void) {
        
        let url = URLs.adSearch
        let parameters: [String: Any] = [
            "search": search
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
                var products = [subCatsDatas]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = subCatsDatas.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }

}

