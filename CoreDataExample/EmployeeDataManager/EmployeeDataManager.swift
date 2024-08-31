//
//  EmployeeDataManager.swift
//  CoreDataExample
//
//  Created by Apple on 31/08/24.
//

import Foundation

struct EmployeeManager{
    private let _employeeDataRepository = EmployeeDataRepository()
    func createEmployee(employee:EmployeeCDModel){
        return _employeeDataRepository.CreateEmployeeData(employee: employee)
    }
    func fetEmployee() -> [EmployeeCDModel]?{
        
        print(" _employeeDataRepository.getAllEmployeeData()=\( _employeeDataRepository.getAllEmployeeData())")
        return _employeeDataRepository.getAllEmployeeData()
    }
    func fetchEmployee(byidentifier id :String) -> EmployeeCDModel?{
        return _employeeDataRepository.get_CDEmployee_Data(byIdentifier: id)
    }
    func updateEmployee(employee:EmployeeCDModel) -> Bool?{
        return  _employeeDataRepository.updateCDEmployee_Data(employee: employee)
    }
    func deleteEmployee(employee:EmployeeCDModel) -> Bool?{
      return  _employeeDataRepository.deleteCDEmployee_Data(record: employee)
    }
}
