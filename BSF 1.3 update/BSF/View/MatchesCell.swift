//
//  MatchesCell.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit

class MatchesCell: UITableViewCell {

    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var matchNum: UILabel!
    
    var sport: Matches!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        self.team1.text = "Team1: \(sport.team1!)"
        self.team2.text = "Team2: \(sport.team2!)"
        self.time.text = "Time: \(sport.time!)"
        self.venue.text = "\(sport.venue!)"
        self.matchNum.text = " Match: \(sport.number!)"
       
        }

}
