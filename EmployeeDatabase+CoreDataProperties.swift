//
//  EmployeeDatabase+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Apple on 31/08/24.
//
//

import Foundation
import CoreData


extension EmployeeDatabase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeDatabase> {
        return NSFetchRequest<EmployeeDatabase>(entityName: "EmployeeDatabase")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?

    
    func convertTOEmployeeCDModel() -> EmployeeCDModel?{
        return EmployeeCDModel(name: self.name!, Email: self.email!, id: self.id!)
    }
}

extension EmployeeDatabase : Identifiable {

}
