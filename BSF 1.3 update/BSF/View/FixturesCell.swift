//
//  FixturesCell.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit

class FixturesCell: UITableViewCell {

    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportCategory: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    
    func configure(fixtures: Fixtures){
        self.sportCategory.text = fixtures.sportCategory
        self.sportName.text = fixtures.sportName
        self.sportImage.image = UIImage(named: fixtures.sportImageName)
    }

}
