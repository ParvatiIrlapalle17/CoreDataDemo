//
//  DetailsViewController.swift
//  CoreDataExample
//
//  Created by Apple on 31/08/24.
//

import UIKit

class DetailsViewController: UIViewController {
    var manager : EmployeeManager = EmployeeManager()
    @IBOutlet weak var EmployeeEmail: UITextField!
    @IBOutlet weak var EmployeeName: UITextField!
    
    var employeeData = [EmployeeCDModel]()
    @IBAction func UpdateClicked(_ sender: Any) {
        
        let updateData = EmployeeCDModel(name: EmployeeName.text!, Email: EmployeeEmail.text!, id: employeeData[0].id)
      let updated = manager.updateEmployee(employee: updateData)
    }
    
//    @IBAction func DeleteClicked(_ sender: Any) {
//        let indexData = employeeData[0]
//        let delete =  manager.deleteEmployee(employee: indexData)
//       
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
print("details employeeData =\(employeeData)")
        self.EmployeeName.text = employeeData[0].name
        self.EmployeeEmail.text = employeeData[0].Email
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
