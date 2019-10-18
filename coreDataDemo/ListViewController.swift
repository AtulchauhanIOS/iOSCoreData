//
//  ListViewController.swift
//  coreDataDemo
//
//  Created by Sharad Kumar on 10/9/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import UIKit

protocol DataPass {
    func data(object:[String:String], index:Int, isEdit:Bool)
    
    
}

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var student = [Student]()
    var delegate:DataPass!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.sharedInstance.getStudentData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//        cell.lblName.text=student[indexPath.row].name
//        cell.lblAddress.text=student[indexPath.row].address
//        cell.lblCity.text=student[indexPath.row].city
//        cell.lblMobile.text=student[indexPath.row].mobile
        cell.student=student[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = DatabaseHelper.sharedInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }

}
