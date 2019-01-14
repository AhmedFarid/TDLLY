//
//  homeVC.swift
//  TDLLY
//
//  Created by farido on 1/4/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var categorues: UICollectionView!
    @IBOutlet weak var subCat: UICollectionView!
    
    var images = [Banners]()
    var categours = [categoury]()
    var subCates = [subCats]()
    
    var singleItem: categoury?
    
    
    var currentIndex = 0
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categorues.delegate = self
        categorues.dataSource = self
        
        subCat.delegate = self
        subCat.dataSource = self
        
        handleRefresh()
        handleRefreshcategoury()
    }
    
    @objc private func handleRefresh() {
        Home.banner{ (error: Error?, images: [Banners]?) in
            if let images = images {
                self.images = images
                print("xxx\(self.images)")
                self.collectionView.reloadData()
                self.pageControl.numberOfPages = images.count
                self.startTimer()
            }
        }
        
    }
    
    @objc private func handleRefreshcategoury() {
        Home.categour{ (error: Error?, categours: [categoury]?) in
            if let categours = categours {
                self.categours = categours
                print("xxx\(self.categours)")
                self.categorues.reloadData()
            }
        }
        
    }
    
    @objc private func handleRefreshSubCategoury() {
        Home.Subcategour(category_id: singleItem?.id ?? "") {(error: Error?, subCates: [subCats]?) in
            if let subCates = subCates {
                self.subCates = subCates
                print("xxx\(self.subCates)")
                self.subCat.reloadData()
            }
        }
        
    }
    
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        
        let desiredScrollPosititon = (currentIndex < images.count - 1) ? currentIndex + 1 : 0
        collectionView.scrollToItem(at: IndexPath(item: desiredScrollPosititon, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func shearApp(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: ["my app link"], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func mnueBtn(_ sender: Any) {
        if helper.getAPIToken() != nil {
            performSegue(withIdentifier: "suge", sender: nil)
        }else {
            self.showAlert(title: "Login", message: "Plz Logon Frist")
        }

    }
    
    @IBAction func all(_ sender: Any) {
        performSegue(withIdentifier: "suge30", sender: nil)
    }
    
    
}


extension homeVC: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return images.count
        }else if collectionView.tag == 1{
           return categours.count
        }else {
            return subCates.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as? SliderCell {
                let iamge = images[indexPath.item]
                cell.configuerCell(prodect: iamge)
                return cell
            }else {
                return SliderCell()
            }
        }else if collectionView.tag == 1{
            if let cell = categorues.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as? catCell {
                let categour = categours[indexPath.row]
                cell.configuerCell(prodect: categour)
                return cell
            }else {
                return catCell()
            }
        } else {
            if let cell = subCat.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath) as? subCatCell {
                let subCate = subCates[indexPath.row]
                cell.configuerCell(prodect: subCate)
                return cell
            }else {
                return subCatCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            print("0")
        }else if collectionView.tag == 1 {
            singleItem = categours[indexPath.row]
            handleRefreshSubCategoury()
        }else {
            performSegue(withIdentifier: "suge25", sender: subCates[indexPath.row])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? subCatDataVC{
            if let sub = sender as? subCats{
                destaiantion.singleItemCat = sub
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else if collectionView.tag == 1 {
            return CGSize(width: 129, height: collectionView.frame.height)
        }else {
            return CGSize(width: 137, height: collectionView.frame.height)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.tag == 0 {
        currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
        pageControl.currentPage = currentIndex
        }
    }
    
}
