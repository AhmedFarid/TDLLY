//
//  addNewAD.swift
//  TDLLY
//
//  Created by farido on 1/7/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class addNewAD: UIViewController {

    
    var categours = [categoury]()
    var subCates = [subCats]()
    var status = ["بدون","جديد","مستعمل"]
    
    var singleItem: categoury?
    
    var selectedCat = ""
    var selectedSub = ""
    var selectedstatus = ""
    
    var selectedCatString: String?
    var selectedSubString: String?
    var selectedstatusString: String?
    
    
    @IBOutlet weak var addName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var cat: UITextField!
    @IBOutlet weak var subcat: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var adType: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var addDes: RoundeTextView!
    @IBOutlet weak var iamge: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleRefreshcategoury()
        createStatusPiker()
        textEnabeld()
    }
    
    var picker_imag: UIImage? {
        didSet{
            guard let image = picker_imag else {return}
            self.iamge.image = image
        }
    }
    
    @objc private func handleAdd(){
        let piker = UIImagePickerController()
        piker.allowsEditing = true
        piker.sourceType = .photoLibrary
        piker.delegate = self
        self.present(piker, animated: true, completion: nil)
        
    }
    
    @objc private func handleRefreshcategoury() {
        Home.categour{ (error: Error?, categours: [categoury]?) in
            if let categours = categours {
                self.categours = categours
                print("xxx\(self.categours)")
                //self.categorues.reloadData()
                self.createCatPiker()
                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshSubCategoury() {
        Home.Subcategour(category_id: selectedCatString ?? "") {(error: Error?, subCates: [subCats]?) in
            if let subCates = subCates {
                self.subCates = subCates
                print("xxx\(self.subCates)")
                self.createSubPiker()
                self.textEnabeld()
                //self.subCat.reloadData()
            }
        }
        
    }
    
    func textEnabeld() {
        if categours.isEmpty == true {
            cat.isEnabled = false
            //prandTF.isEnabled = false
        }else {
            cat.isEnabled = true
            //prandTF.isEnabled = true
        }
        
        if subCates.isEmpty == true {
            //locationTF.isEnabled = false
            subcat.isEnabled = false
        }else {
            //locationTF.isEnabled = true
            subcat.isEnabled = true
        }
    }
    
    func createCatPiker(){
        let catPiker = UIPickerView()
        catPiker.delegate = self
        catPiker.dataSource = self
        catPiker.tag = 0
        cat.inputView = catPiker
        catPiker.reloadAllComponents()
    }
    
    func createSubPiker(){
        let subPiker = UIPickerView()
        subPiker.delegate = self
        subPiker.dataSource = self
        subPiker.tag = 1
        subcat.inputView = subPiker
        subPiker.reloadAllComponents()
    }
    
    func createStatusPiker(){
        let statusPiker = UIPickerView()
        statusPiker.delegate = self
        statusPiker.dataSource = self
        statusPiker.tag = 2
        adType.inputView = statusPiker
        statusPiker.reloadAllComponents()
    }
    
    @IBAction func uploadPhoto(_ sender: Any) {
        handleAdd()
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        guard let name = addName.text, !name.isEmpty else {
            let messages = NSLocalizedString("من فضلك اضف اسم الاعلان", comment: "hhhh")
            let title = NSLocalizedString("اضافه اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = address.text, !phones.isEmpty else {
            let messages = NSLocalizedString("من فضلك اضف العنوان", comment: "hhhh")
            let title = NSLocalizedString("اضافة اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let emails = cat.text, !emails.isEmpty else {
            let messages = NSLocalizedString("اختار القسم", comment: "hhhh")
            let title = NSLocalizedString("اضافه اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let citys = subcat.text, !citys.isEmpty else {
            let messages = NSLocalizedString("اختار الفرع", comment: "hhhh")
            let title = NSLocalizedString("اضافة اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let userNames = price.text, !userNames.isEmpty else {
            let messages = NSLocalizedString("اختار سعر", comment: "hhhh")
            let title = NSLocalizedString("اضافة اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = adType.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("اختار نوع الاعلان", comment: "hhhh")
            let title = NSLocalizedString("اضافه اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        guard let addresss = phone.text, !addresss.isEmpty else {
            let messages = NSLocalizedString("اختار هاتف", comment: "hhhh")
            let title = NSLocalizedString("اضافة اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let contrys = addDes.text, !contrys.isEmpty else {
            let messages = NSLocalizedString("اختار وصف", comment: "hhhh")
            let title = NSLocalizedString("اضافة اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard iamge.image != nil else {
            let messages = NSLocalizedString("اختار صورة", comment: "hhhh")
            let title = NSLocalizedString("اضافة اعلان", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        ads.Addad(name_ad: addName.text ?? "", address: address.text ?? "", category_id: selectedCatString ?? "", sub_category_id: selectedSubString ?? "", price:  price.text ?? "", type_ad:  selectedstatusString ?? "", phone: phone.text ?? "", description:  addDes.text, location:  "555555", image: iamge.image ?? #imageLiteral(resourceName: "ADD1 copy")) { (error: Error?, success: Bool, data) in
            if success {
                self.showAlert(title: "اضافه اعلان", message: data ?? "")
            }else {
                self.showAlert(title: "اضافه اعلان", message: data ?? "")
            }
        }
    }
}


extension addNewAD: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return categours.count
        }else if pickerView.tag == 1 {
            return subCates.count
        }else {
            return status.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return categours[row].name
        }else if pickerView.tag == 1{
            return subCates[row].title
        }else {
            return status[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            selectedCatString = categours[row].id
            cat.text = categours[row].name
            handleRefreshSubCategoury()
            self.view.endEditing(false)
        }else if pickerView.tag == 1{
            selectedSubString = subCates[row].subCategoryId
            subcat.text = subCates[row].title
            self.view.endEditing(false)
        }else{
            selectedstatusString = status[row]
            adType.text = selectedstatusString
            self.view.endEditing(false)
        }
    }
}


extension addNewAD: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.picker_imag = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.picker_imag = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
