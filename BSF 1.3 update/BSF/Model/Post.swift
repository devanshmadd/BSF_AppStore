//
//  Post.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//
import UIKit
import Firebase
import SwiftyJSON

class Post{
    var caption: String!
    var imageDownloadURL: String!
    private var image: UIImage!
    var timestamp: String!
    var titel: String!
    var sport: String!
    
    init(image: UIImage, caption: String, title: String, timestamp: String, sport: String) {
        self.image = image
        self.caption = caption
        self.timestamp = timestamp
        self.titel = title
        self.sport = sport
    }
    
    
    init(snapshot: DataSnapshot) {
        let json: JSON = JSON(snapshot.value!)
        print(json)
        self.imageDownloadURL = json["url"].stringValue
        self.caption = json["caption"].stringValue
        self.titel = json["title"].stringValue
        self.sport = json["sport"].stringValue
        self.timestamp = json["timestamp"].stringValue
    }
        

    
    
    func save(){
        let newPostRef = Database.database().reference().child("NFPost").childByAutoId()
        let newPostKey = newPostRef.key!
        
        if let imageData = self.image.jpegData(compressionQuality: 0.6){
            let storageRef = Storage.storage().reference().child("Images")
            let newImgRef = storageRef.child(newPostKey)
            
            newImgRef.putData(imageData).observe(.success) { (snapshot) in
                
            newImgRef.downloadURL(completion: { (url,error) in
                let newPostDictionary = ["caption": self.caption,"sport": self.sport, "timestamp": self.timestamp,   "title": self.titel, "url": url?.absoluteString]
                    newPostRef.setValue(newPostDictionary)
                })
            }
        }
        
        
        
    } //end of save function

}
