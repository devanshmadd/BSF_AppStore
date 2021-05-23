//
//  MatchesVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//
import UIKit
import Firebase


class MatchesVC: UIViewController {

    @IBOutlet weak var matchTableView: UITableView!
    @IBOutlet weak var addFixturesBtn: UIBarButtonItem!
    
//    var sport: Int!
//    var dateID: Int!
    var matchfetch: MatchDetails!
    
    var matches = [Matches]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
              

        self.navigationItem.title = "\(matchfetch.sportName) \(matchfetch.sportCategory)"
        Database.database().reference().child("Fixtures").child(matchfetch.date).child(matchfetch.sportName).child(matchfetch.sportCategory).observe(.childAdded) { (snapshot) in
            
            let match = Matches(snapshot: snapshot)
            self.matches.insert(match, at: 0)
            let indexpath: IndexPath = IndexPath(row: 0, section: 0)
            self.matchTableView.insertRows(at: [indexpath], with: .top)
            if self.matches.count == 0{
                self.matchTableView.isHidden = true
            }else{
                self.matchTableView.isHidden = false
            }
        }
        
       
    }

    
    override func viewWillAppear(_ animated: Bool) {
        if !isLoggedIn{
            addFixturesBtn.isEnabled = false
            addFixturesBtn.tintColor = UIColor.clear
        }else{
            addFixturesBtn.isEnabled = true
            addFixturesBtn.tintColor = UIColor.white
        }
    }
    
    @IBAction func addFixturesBtnPressed(_ sender: Any){
        
        performSegue(withIdentifier: "mat", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc = segue.destination as? AddFixturesVC else {return}
        vc.matchadd = matchfetch
    }
    
    
    
    
}

extension MatchesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sport", for: indexPath) as? MatchesCell
              
            else {
                return UITableViewCell()}
         
        cell.sport = matches[indexPath.row]
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    
}

