//
//  subCatDataVC.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class subCatDataVC: UIViewController {

    var singleItemCat: subCats?
    var subs = [subCatsDatas]()
    
    var type = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(singleItemCat?.subCategoryId ?? "")
        self.navigationItem.title = singleItemCat?.title
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if singleItemCat?.subCategoryId == "" {
            self.type = "all"
        }else {
            self.type = "sub_category"
        }
        
        handleRefreshSub()
        
        
        
    }
    
    
    
    @objc private func handleRefreshSub() {
        Home.SubcategourData(sub_category_id: singleItemCat?.subCategoryId ?? "1",type: type) {(error: Error?, subs: [subCatsDatas]?) in
            if let subs = subs {
                self.subs = subs
                print("xxx\(self.subs)")
                self.tableView.reloadData()
            }
        }
    }
    
}

extension subCatDataVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? subCatdataCell {
            let sub = subs[indexPath.item]
            cell.configuerCell(prodect: sub)
            return cell
        }else {
            return subCatdataCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: subs[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? adSubDetiles{
            if let sub = sender as? subCatsDatas{
                destaiantion.singleItem = sub
            }
            
        }
    }
}
