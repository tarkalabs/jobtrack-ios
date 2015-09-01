//
//  Shift.swift
//  JobTrack
//
//  Created by Vagmi on 31/08/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import Foundation

class Shift {
    var shiftDate:DateTime
    var checkins:[Checkin] = []
    
    init(shiftDate:DateTime, checkins: [Checkin]) {
        self.shiftDate = shiftDate
        self.checkins = checkins
    }
    
    static func generateShifts(days: Int) -> [Shift] {
        var shifts:[Shift] = []
        (0...days).forEach { (d) in
            let startDate = DateTime().plus((d-1).days)
            let checkins = Employee.sampleEmployees(2).map { (e) -> Checkin in
                Checkin(employee: e, checkinDate: startDate)
            }
            shifts.append(Shift(shiftDate: startDate, checkins: checkins))
        }
        return shifts
    }
}