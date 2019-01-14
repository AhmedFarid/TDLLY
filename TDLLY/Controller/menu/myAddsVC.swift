//
//  myAddsVC.swift
//  TDLLY
//
//  Created by farido on 1/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class myAddsVC: UIViewController {
    
    var subs = [myAdds]()

    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
        handleRefreshSub()
    }
    
    @objc private func handleRefreshSub() {
        ads.myadds{(error: Error?, subs: [myAdds]?) in
            if let subs = subs {
                self.subs = subs
                print("xxx\(self.subs)")
                self.tabelView.reloadData()
            }
        }
    }
    
}

extension myAddsVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myadds {
            let sub = subs[indexPath.item]
            cell.configuerCell(prodect: sub)
            return cell
        }else {
            return myadds()
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "suge", sender: subs[indexPath.item])
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destaiantion = segue.destination as? adSubDetiles{
//            if let sub = sender as? subCatsDatas{
//                destaiantion.singleItem = sub
//            }
//
//        }
//    }
}
