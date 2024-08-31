//
//  EmployeeDataRepository.swift
//  CoreDataExample
//
//  Created by Apple on 31/08/24.
//

import Foundation
import CoreData
protocol EmployeeRepositoryProtocol{
    func CreateEmployeeData(employee:EmployeeCDModel)
 func getAllEmployeeData() -> [EmployeeCDModel]
}
struct EmployeeDataRepository:EmployeeRepositoryProtocol{
  func getAllEmployeeData() -> [EmployeeCDModel] {
       let AllEmployeeData = PersistanceCDStore.shared.fetchObject(managedobject: EmployeeDatabase.self)
      var employee : [EmployeeCDModel] = []
      AllEmployeeData?.forEach({ (cdemployee) in
          
          employee.append(cdemployee.convertTOEmployeeCDModel()!)
      })
      
      return employee
    }
    
    func CreateEmployeeData(employee: EmployeeCDModel) {
        let SaveEmployeeData = EmployeeDatabase(context: PersistanceCDStore.shared.context)
        SaveEmployeeData.email = employee.Email
        SaveEmployeeData.name = employee.name
        SaveEmployeeData.id = employee.id
        
        PersistanceCDStore.shared.saveContext()
    }
    func get_CDEmployee_Data(byIdentifier id: String) -> EmployeeCDModel? {
        let result =  getAllCDEmployeeByid(byIdentifier: id)
        guard result != nil else{return nil}
        return result?.convertTOEmployeeCDModel()
    }
    
    func updateCDEmployee_Data(employee: EmployeeCDModel) -> Bool? {
        let result =  getAllCDEmployeeByid(byIdentifier: employee.id)
        guard result != nil else{return nil}
        result?.email = employee.Email
        result?.id  = employee.id
        result?.name  = employee.name
       
        PersistanceCDStore.shared.saveContext()
       
        return true
    }
    
    func deleteCDEmployee_Data(record: EmployeeCDModel) -> Bool? {
        let result =  getAllCDEmployeeByid(byIdentifier: record.id)
        guard result != nil else{return nil}
       
        PersistanceCDStore.shared.context.delete(result!)
        return true
    }
    
    
    
    
   
    func getAllCDEmployeeByid(byIdentifier id: String ) -> EmployeeDatabase?{
        
     let fetchRequest = NSFetchRequest<EmployeeDatabase>(entityName: "EmployeeDatabase")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do{
            let result = try PersistanceCDStore.shared.context.fetch(fetchRequest).first

            guard result !== nil else{return nil}

            return result
        }catch let error{
            print(error)
        }
        return nil
    }
    
   
    
 
    
    
}
