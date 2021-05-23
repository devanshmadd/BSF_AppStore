//
//  ViewController.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit
import Firebase
import Reachability


class NewsFeedVC: UIViewController{
    

    let reachabilty = Reachability()!
    
    var posts = [Post]()
    var shouldAnimate = true
    @IBOutlet weak var newsFeedTableView: UITableView!
    @IBOutlet weak var addPostBtn: UIBarButtonItem!
    @IBOutlet weak var internetView: UIView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startInternetCheck()
        myActivityIndicator.startAnimating()
      
        Database.database().reference().child("NFPost").observe(.childAdded) { (snapshot) in
            DispatchQueue.main.async{
                
                    let newPost = Post(snapshot: snapshot)
                    self.posts.insert(newPost, at: 0)
                    let indexpath = IndexPath(row: 0, section: 0)
                    self.newsFeedTableView.insertRows(at: [indexpath], with: .top)
                if self.posts.count == 0{
                    self.newsFeedTableView.isHidden = true
                }else {
                    self.myActivityIndicator.stopAnimating()
                    self.newsFeedTableView.isHidden = false
                }
               
            }
        }
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        
        stopPlayingVideo()

        if !isLoggedIn{
            addPostBtn.isEnabled = false
            addPostBtn.tintColor = UIColor.clear
        }else{
            addPostBtn.isEnabled = true
            addPostBtn.tintColor = UIColor.white
        }
    }
  
    @IBAction func showLoginScreen(_ sender: UIBarButtonItem) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "login") else {return}
        present(vc, animated: true, completion: nil)
    }
    
   @objc func internetChanged(none: Notification){
        
        let reachab = none.object as! Reachability
        
      if reachab.connection == .none{
         showAlert2(title: "No Internet Connection", message: "Please check your internet connection")
       
      }else if reachab.connection == .wifi{
        print("Internet is back!!")
      }
    }
    
    
    func startInternetCheck(){
        
        if reachabilty.connection != .none{
           
        }
        
        if reachabilty.connection == .none{
            myActivityIndicator.stopAnimating()
            showAlert(title: "No Internet Connection", message: "No internet connection, please try again later, with active internet connection")
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged), name: NSNotification.Name.reachabilityChanged, object: reachabilty)
        
        do{
            try reachabilty.startNotifier()
        }catch{
            print("error...")
        }
    }
    
    
    

}

extension NewsFeedVC: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsfeed", for: indexPath) as? NewsFeedCell else {return UITableViewCell()}
  
        cell.post = self.posts[indexPath.row]
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}

