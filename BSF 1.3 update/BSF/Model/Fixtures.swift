//
//  Fixtures.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import Foundation

class Fixtures{
    private(set) public var sportName: String
    private(set) public var sportCategory: String
    private(set) public var sportImageName: String
 
    init(name: String, category: String, sname: String) {
        self.sportName = name
        self.sportCategory = category
        self.sportImageName = sname
    }
}
