//
//  SportResultVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit
import Firebase

class SportResultVC: UIViewController {

    var resultfetch: MatchDetails!
       var sportRes = [SportResult]()
    
    @IBOutlet weak var sportResultTableView: UITableView!
    @IBOutlet weak var addResultBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "\(resultfetch.sportName) \(resultfetch.sportCategory)"
        Database.database().reference().child("Results").child(resultfetch.date).child(resultfetch.sportName).child(resultfetch.sportCategory).observe(.childAdded) { (snapshot) in
        
            DispatchQueue.main.async {
                let result = SportResult(snapshot: snapshot)
                self.sportRes.insert(result, at: 0)
                let indexpath: IndexPath = IndexPath(row: 0, section: 0)
                self.sportResultTableView.insertRows(at: [indexpath], with: .top)
               
                if self.sportRes.count == 0{
                    self.sportResultTableView.isHidden = true
                }else{
                    self.sportResultTableView.isHidden = false
                }
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !isLoggedIn{
            addResultBtn.isEnabled = false
            addResultBtn.tintColor = UIColor.clear
        }else{
            addResultBtn.isEnabled = true
            addResultBtn.tintColor = UIColor.white
        }
    }
    
    @IBAction func addResultBtnPressed(_ sender: Any){
        performSegue(withIdentifier: "resm", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AddResultVC else {return}
        vc.resultadd = resultfetch
    }
    
}

extension SportResultVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sportres", for: indexPath) as? SportResultCell else {return UITableViewCell()}
        
        cell.res = sportRes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
