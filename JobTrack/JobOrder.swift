//
//  JobOrder.swift
//  JobTrack
//
//  Created by Vagmi on 28/08/15.
//  Copyright (c) 2015 Vagmi. All rights reserved.
//

import Foundation


class JobOrder {
    var jobId:String = ""
    var description:String = ""
    var client:Client
    var startDate:DateTime
    var endDate:DateTime
    init(jobId: String, description: String, client: Client, startDate: DateTime, endDate: DateTime) {
        self.description = description
        self.client = client
        self.startDate = startDate
        self.endDate = endDate
    }
    
    static func randomJobOrder() -> JobOrder {
        let parts = [ "Hammer Mill DFZC",
                      "Impact machine Matador MJZH",
                      "Calvin Transmorgifier",
                      "Warp drive",
                      "BFG 10K",
                      "Scotty BMU Transporter",
                      "PylonMet color vacuum coater",
                      "Magnetic Separator MMUA" ]
        let random = Int(arc4random_uniform(UInt32(parts.count)))
        let part = parts[random]
        let jobNumber = String(arc4random_uniform(300) + 1234)
        let startOffset = Int(arc4random_uniform(5)) - 3
        let startTime = DateTime().plus(startOffset.days)
        let endTime = startTime.plus(2.days)
        
        return JobOrder(jobId: jobNumber, description: part, client: Client.randomClient(), startDate: startTime, endDate: endTime)
    }
}