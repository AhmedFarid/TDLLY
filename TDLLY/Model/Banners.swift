//
//  Banners.swift
//  TDLLY
//
//  Created by farido on 1/5/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class Banners: NSObject {
    
    var img: String
    
    init?(dict: [String: JSON]){
        
        guard let img = dict["image"]?.string else {return nil}
        
        
        self.img = img
        
    }
}

class categoury: NSObject {
    
    var id: String
    var name: String
    var image: String
    
    init?(dict: [String: JSON]){
        
        guard let image = dict["image"]?.string,let name = dict["name"]?.string,let id = dict["id"]?.string else {return nil}
        
        self.id = id
        self.name = name
        self.image = image
    }
}


class subCats: NSObject {
    
    var subCategoryId: String
    var categoryName: String
    var title: String
    var image: String
    
    init?(dict: [String: JSON]){
        
        guard let subCategoryId = dict["subCategoryId"]?.string,let categoryName = dict["category Name"]?.string,let title = dict["title"]?.string,let image = dict["image"]?.string else {return nil}
        
        self.subCategoryId = subCategoryId
        self.categoryName = categoryName
        self.title = title
        self.image = image
    }
}


class subCatsDatas: NSObject {
    
    var id: String
    var name: String
    var address: String
    var price: String
    var type_ad: String
    var date: String
    var des: String
    var image: String
    var phone: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string,let name = dict["name"]?.string,let address = dict["address"]?.string,let price = dict["price"]?.string,let type_ad = dict["type_ad"]?.string,let date = dict["date"]?.string,let des = dict["description"]?.string,let image = dict["image"]?.string,let phone = dict["phone"]?.string else {return nil}
        
        self.id = id
        self.name = name
        self.address = address
        self.price = price
        self.type_ad = type_ad
        self.date = date
        self.des = des
        self.image = image
        self.phone = phone
        
    }
}

class myAdds: NSObject {
    
    var idAd: String
    var nameAd: String
    var address: String
    var location: String
    var categoryName: String
    var subCategoryName: String
    var price: String
    var type_ad: String
    var phone: String
    var image: String

    
    init?(dict: [String: JSON]){
        
        guard let idAd = dict["idAd"]?.string,let nameAd = dict["nameAd"]?.string,let address = dict["address"]?.string,let location = dict["location"]?.string,let categoryName = dict["categoryName"]?.string,let subCategoryName = dict["subCategoryName"]?.string,let price = dict["price"]?.string,let type_ad = dict["type_ad"]?.string,let phone = dict["phone"]?.string,let image = dict["image"]?.string else {return nil}
        
        self.idAd = idAd
        self.nameAd = nameAd
        self.address = address
        self.location = location
        self.categoryName = categoryName
        self.subCategoryName = subCategoryName
        self.price = price
        self.type_ad = type_ad
        self.phone = phone
        self.image = image
        
    }
}
