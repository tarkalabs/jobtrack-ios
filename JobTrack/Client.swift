//
//  Client.swift
//  JobTrack
//
//  Created by Vagmi on 28/08/15.
//  Copyright (c) 2015 Vagmi. All rights reserved.
//

import Foundation

class Client {
    var name:String
    
    init(name: String) {
        self.name = name
    }
    
    static let CLIENTS = [
        Client(name: "Los Pollos Hermanos"),
        Client(name: "Acme Inc."),
        Client(name: "Nestle Spa."),
        Client(name: "Kissan foods."),
        Client(name: "Vamanos Pest Control"),
        Client(name: "Madrigal Electromotive GmbH"),
        Client(name: "Lavandería Brillante")
    ]
    
    static func randomClient() -> Client {
        let counts = UInt32(CLIENTS.count)
        let random = Int(arc4random_uniform(counts))
        return CLIENTS[random]
    }
}