//
//  SportResultCell.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit

class SportResultCell: UITableViewCell {

    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var matchNum: UILabel!
    
    
    var res: SportResult!{
        didSet{
            self.updateUI()
        }
    }
    
    
    func updateUI(){
        self.team1.text = "Team 1: \(res.team1!)"
        self.team2.text = "Team 2: \(res.team2!)"
        self.result.text = "\(res.result!)"
        self.matchNum.text = "Match: \(res.number!)"
    }
}
