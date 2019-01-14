//
//  searchVC.swift
//  TDLLY
//
//  Created by farido on 1/6/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class searchVC: UIViewController,UITextFieldDelegate {

    var subs = [subCatsDatas]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTf: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.searchTf.delegate = self
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textField code
        
        searchTf.resignFirstResponder()  //if desired
        performAction()
        return true
    }
    
    func performAction() {
        if searchTf.text != "" {
            handleRefreshSub()
            print("xxxx")
        }
    }
    
    @objc private func handleRefreshSub() {
        Home.shearch(search: searchTf.text ?? "") {(error: Error?, subs: [subCatsDatas]?) in
            if let subs = subs {
                self.subs = subs
                print("xxx\(self.subs)")
                self.tableView.reloadData()
            }
        }
    }
    
}
    
extension searchVC: UITableViewDelegate, UITableViewDataSource {
    
    
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
