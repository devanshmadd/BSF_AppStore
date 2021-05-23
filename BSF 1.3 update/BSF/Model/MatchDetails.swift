//
//  MatchDetails.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import Foundation

class MatchDetails{
    private(set) public var sportName: String
    private(set) public var sportCategory: String
    private(set) public var date: String
    
    init(sn: String, sc: String, d: String) {
        self.date = d
        self.sportCategory = sc
        self.sportName = sn
    }
}
