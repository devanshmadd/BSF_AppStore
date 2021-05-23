//
//  Matches.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON

class Matches{
    var team1: String!
    var team2: String!
    var time: String!
    var venue: String!
    var number: String!
    
    init(t1: String, t2: String, t: String, v: String, n: String) {
        self.team1 = t1
        self.team2 = t2
        self.time = t2
        self.venue = v
        self.number = n
    }
    
    init(snapshot: DataSnapshot) {
        
        if let snap = snapshot.value{
            let json: JSON = JSON(snap)
            self.team1 = json["team1"].stringValue
            self.team2 = json["team2"].stringValue
            self.time = json["time"].stringValue
            self.venue = json["venue"].stringValue
            self.number = json["number"].stringValue
        }else {
            print("No data...")
        }
    }
}
