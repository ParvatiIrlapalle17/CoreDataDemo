//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Apple on 31/08/24.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func CreateClicked(_ sender: Any) {
        let employeeData = EmployeeCDModel(name: Employee_Name_Txt.text!, Email: EMployee_Email_Txt.text!, id: "EID" + Empoyeeid.text!)
        Manager.createEmployee(employee: employeeData)
        getallEmployeeData = Manager.fetEmployee()!
        self.Emaployee_Details_TableView.reloadData()
       
    }
    
    @IBOutlet weak var Emaployee_Details_TableView: UITableView!
    @IBOutlet weak var Empoyeeid: UITextField!
    @IBOutlet weak var EMployee_Email_Txt: UITextField!
    @IBOutlet weak var Employee_Name_Txt: UITextField!
    var getallEmployeeData = [EmployeeCDModel]()
    let Manager:EmployeeManager =  EmployeeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        getallEmployeeData = Manager.fetEmployee() ?? []
        print("getallEmployeeDataViewController=\(getallEmployeeData)")
        
        Emaployee_Details_TableView.delegate = self
        Emaployee_Details_TableView.dataSource = self
        
        Emaployee_Details_TableView.reloadData()
        // Do any additional setup after loading the view.
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getallEmployeeData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Emaployee_Details_TableView.dequeueReusableCell(withIdentifier: "EmpoyeeDetailTableViewCell", for: indexPath) as! EmpoyeeDetailTableViewCell
        let indexData = getallEmployeeData[indexPath.row]
        cell.EmployeeName.text = indexData.name
        cell.EmployeeEmaillbl.text = indexData.Email
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let indexData = getallEmployeeData[indexPath.row]
        
        
        
        
        
        if editingStyle == .delete{
           let delete =  Manager.deleteEmployee(employee: indexData)
            getallEmployeeData = Manager.fetEmployee()!
            self.Emaployee_Details_TableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexData = getallEmployeeData[indexPath.row]
        var selecteddata = [indexData]
        print("selecteddata=\(selecteddata)")
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController)!
        vc.employeeData = selecteddata
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
