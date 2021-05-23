//
//  NewsFeedCell.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage


class NewsFeedCell: UITableViewCell {
    
    @IBOutlet weak var newsFeedTitle: UILabel!
    @IBOutlet weak var newsFeedImage: UIImageView!
    @IBOutlet weak var newsFeedCaption: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    
    var delegate: ThreePartCellDelegate?
    var isExpanded: Bool = false
    

    
    var post: Post!{
        didSet{
            self.updateUI()
        }
    }
    
    
    func updateUI(){
        self.newsFeedCaption.text = post.caption
        self.newsFeedTitle.text = post.titel
        self.timeStamp.text = post.timestamp
        self.sportImage.image = UIImage(named: post.sport)
        self.newsFeedImage.sd_setImage(with: URL(string: post.imageDownloadURL))
        
//        if let imageURL = post.imageDownloadURL{
//            let imageStorageRef = Storage.storage().reference(forURL: imageURL)
//            imageStorageRef.getData(maxSize: 2 * 1024 * 1024) { [weak self](data, error) in
//                if let error = error{
//                    print("\(error)")
//                }else{
//                    // success
//
//                    if let imageData = data{
//                        DispatchQueue.main.async {
//                            let image = UIImage(data: imageData)
//                            self!.newsFeedImage.image = image
//                        }
//                    }
//                }
//            }
//        }
    }
}
