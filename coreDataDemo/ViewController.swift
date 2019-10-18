//
//  ViewController.swift
//  coreDataDemo
//
//  Created by Sharad Kumar on 9/25/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataPass {
    
    

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    var i = Int()
    var isUpdate = Bool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func saveBtn(_ sender: Any)
    {
        let dict = ["name":txtName.text,"address":txtAddress.text,"city":txtCity.text,"mobile":txtMobileNo.text]
        if isUpdate {
            DatabaseHelper.sharedInstance.editData(object: dict as! [String:String], i:i)
        }else{
            DatabaseHelper.sharedInstance.save(object: dict as! [String : String])
        }
        
    }
    @IBAction func showBtn(_ sender: Any)
    {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        listVC.delegate=self
        self.navigationController?.pushViewController(listVC, animated: true)
        
    }
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text=object["name"]
        txtAddress.text=object["address"]
        txtCity.text=object["city"]
        txtMobileNo.text=object["mobile"]
        i = index
        isEditing = isEdit
    }
    
}

