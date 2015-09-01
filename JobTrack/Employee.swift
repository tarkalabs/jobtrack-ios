//
//  Employee.swift
//  JobTrack
//
//  Created by Vagmi on 31/08/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import Foundation

class Employee :NSObject {
    let avatar:String
    let name:String
    let employeeId:String
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
        self.employeeId = String(arc4random_uniform(200) + 1234)
    }
    
    static let employees = [
        Employee(name: "Gus Fring", avatar: "gus"),
        Employee(name: "Hank Schrader", avatar: "hank"),
        Employee(name: "Jesse Pinkman", avatar: "jesse"),
        Employee(name: "Mike Ehrmantraut", avatar: "mike"),
        Employee(name: "Saul Goodman", avatar: "saul"),
        Employee(name: "Skyler White", avatar: "skyler"),
        Employee(name: "Walter White", avatar: "walter"),
        
    ]
    
    static func randomEmployee() -> Employee {
        return employees[Int(arc4random_uniform(UInt32(employees.count)))]
    }
    
    static func sampleEmployees(num: Int) -> [Employee] {
        var employees:[Employee] = []
        (1...num).forEach { (_) in
            var emp = randomEmployee()
            if(employees.contains { $0==emp }) {
                employees.append(randomEmployee())
            } else {
                employees.append(emp)
            }
        }
        return employees
    }
}