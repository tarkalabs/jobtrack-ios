//
//  Plant.swift
//  JobTrack
//
//  Created by Vagmi on 28/08/15.
//  Copyright (c) 2015 Vagmi. All rights reserved.
//

import Foundation

class Plant {
    var name:String
    var jobOrders:[JobOrder]
    var shifts:[Shift]
    var icon:String
    
    init(name:String, icon:String) {
        self.name = name
        self.icon = icon
        self.jobOrders = (1...5).map { (_) -> JobOrder in JobOrder.randomJobOrder() }
        self.shifts = Shift.generateShifts(4)
    }
    
    static func generatePlants() -> [Plant] {
        return [
            Plant(name: "Sheet Metal", icon: "sheetMetal"),
            Plant(name: "Die Cast", icon: "dieCast"),
            Plant(name: "Painting", icon: "paint"),
            Plant(name: "Assembly", icon: "assembly"),
        ]
    }
}