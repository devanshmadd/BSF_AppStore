//
//  ResultCell.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//
import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportCategory: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    
    func configure(result: Fixtures){
        self.sportCategory.text = result.sportCategory
        self.sportName.text = result.sportName
        self.sportImage.image = UIImage(named: result.sportImageName)
    }

}
