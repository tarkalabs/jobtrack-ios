//
//  Checkin.swift
//  JobTrack
//
//  Created by Vagmi on 31/08/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import Foundation

class Checkin {
    var employee:Employee
    var checkinDate:DateTime
    
    init(employee: Employee, checkinDate: DateTime) {
        self.employee = employee
        self.checkinDate = checkinDate
    }
}