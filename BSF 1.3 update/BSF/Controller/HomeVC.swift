//
//  HomeVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 11/16/19.
//  Copyright © 2019 BSF. All rights reserved.

import UIKit
import AVFoundation
import AVKit
import SDWebImage

let avPlayerViewController = AVPlayerViewController()
var avPlayer: AVPlayer?


class HomeVC: UIViewController {
    
    @IBOutlet weak var videoFrame: UIView!
    @IBOutlet weak var c1lbl1: UILabel!
    @IBOutlet weak var c2lbl2: UILabel!
    @IBOutlet weak var c3lbl3: UILabel!
    @IBOutlet weak var c4lbl4: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view1.layer.borderWidth = 1.5
        view1.layer.cornerRadius = 10.0
        
        view2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view2.layer.borderWidth = 1.5
        view2.layer.cornerRadius = 10.0
        
        view3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view3.layer.borderWidth = 1.5
        view3.layer.cornerRadius = 10.0
        
        view4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view4.layer.borderWidth = 1.5
        view4.layer.cornerRadius = 10.0
        
        
        updateLables()
        let date = Date()
          let abc = Int("\(date.hour12)")! + 12
        print("\(date.day)-\(date.monthMedium)-\(date.year) at \(abc):\(date.minute0x)\(date.ampm)")

        let urlPathString: String? = Bundle.main.path(forResource: "video", ofType: "mp4")
        //        let playerFrame = CGRect(x: 0, y: 0, width: videoFrame.frame.width, height: videoFrame.frame.height)
                if let urlPath = urlPathString{
                    let movieurl = URL(fileURLWithPath: urlPath)
                    avPlayer = AVPlayer(url: movieurl)
                    avPlayerViewController.player = avPlayer
                    avPlayerViewController.view.frame = videoFrame.bounds
                    avPlayerViewController.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    videoFrame.addSubview(avPlayerViewController.view)
                    avPlayerViewController.didMove(toParent: self)
                    avPlayerViewController.player?.play()
                }
        
    }
    
    func updateLables(){
        
        img1.layer.cornerRadius = 10.0
        img2.layer.cornerRadius = 10.0
        img3.layer.cornerRadius = 10.0
        img4.layer.cornerRadius = 10.0
        
        img1.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/abcd-d05e8.appspot.com/o/24210335_1955987564418286_6934615556392492686_o.jpg?alt=media&token=b962e133-f5d3-4f64-9a02-d221095bfe1f"))

        img2.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/abcd-d05e8.appspot.com/o/1AV_7939.JPG?alt=media&token=afe270e0-87a7-4266-a410-2fe8303ef439"))

        img3.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/abcd-d05e8.appspot.com/o/Sunburn.jpg?alt=media&token=6799c07a-f87d-4be5-a2a1-d2c8973f2532"))

        img4.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/abcd-d05e8.appspot.com/o/SNL_0187.JPG?alt=media&token=371a9a0c-bd27-4e9c-b733-c8d2c02d3630"))
        
        
        c1lbl1.text = "The grand opening of BITS Sports Festival 2019, taking place at 4:00pm on the 24th of November. \n - Opening Speeches \n - Torch lighting and Commencement of BSF 19 \n - March past and Flag display by the athletes of BITS"
        c2lbl2.text = "Presenting Archery and Boxing Sport categories for the first time in BSF! Witness university boxing athletes go head to head in 4 major boxing categories! Watch the accuracy and precision of collegiate-level archery contestants!  \n - Boxing Inauguration and matches: 25th November, 7pm onwards \n - Archery Inauguration and matches: 25th November, 4pm onwards"
        c3lbl3.text = "Dance Night for the athletes of BSF! Immerse yourself in the music provided by our very own music partner, Sunburn Campus! Music includes English dance music, and an hour's worth of bollywood dance music! \n - Sunburn DJs : DJ Kunal, DJ Candice \n - Concert on 27th November, 8:30pm onwards"
        c4lbl4.text = "The closing ceremony and prize distribution for the 17th edition of BITS Sports Festival. The ceremony is to be graced the Chief Guest of BSF'19 - MR. DJ Bravo! \n - Closing Ceremony on 28th November, 6pm onwards \n - Closing Address by BSF Organizers \n - Special event with DJ Bravo (Surprise!) \n - Awards and Overall Trophy presentation with DJ Bravo, and Campus Director Prof. R. N. Saha"
    }
  
}


