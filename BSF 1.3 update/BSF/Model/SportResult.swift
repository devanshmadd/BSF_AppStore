//
//  SportResult.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON

class SportResult{
    
   var team1: String!
   var team2: String!
   var result: String!
    var number: String!
    
    init(t1: String, t2: String, r: String, n: String) {
        self.team1 = t1
        self.team2 = t2
        self.result = r
        self.number = n
    }
    
    init(snapshot: DataSnapshot) {
        
        let json: JSON = JSON(snapshot.value!)
        self.team1 = json["team1"].stringValue
        self.team2 = json["team2"].stringValue
        self.result = json["result_string"].stringValue
        self.number = json["number"].stringValue
        
    }
    
}
