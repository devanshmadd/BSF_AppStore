//
//  FixturesVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit
import Firebase

class FixturesVC: UIViewController {

//    var sportSelected: Int!
//    var date: Int!
    
    var sportName: String!
    var sportCategory: String!
    var date: Int!
    
    @IBOutlet weak var dateTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Picker View
        
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        dateTxtField.inputView = picker
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopPlayingVideo()
    }
    
}

extension FixturesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixturesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fixtures", for: indexPath) as? FixturesCell else {return UITableViewCell()}
        
        cell.configure(fixtures: fixturesData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
          
//        sportSelected = fixturesData[indexPath.row].sportID
        sportName = fixturesData[indexPath.row].sportName
        sportCategory = fixturesData[indexPath.row].sportCategory
        
        if date != nil{
            performSegue(withIdentifier: "fix", sender: self)
        }else{
            showAlert2(title: "Date not selected!", message: "Please select a date to proceed further.")
        }
            tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc = segue.destination as? MatchesVC else {return}
//        vc.sport = sportSelected
//        vc.dateID = date
        
        let matchdetails = MatchDetails(sn: sportName, sc: sportCategory, d: daySelected(dateID: date))
        
        vc.matchfetch = matchdetails
    }
    
    
}


extension FixturesVC: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return fixturesDate.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return fixturesDate[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row > 0{
            self.date = row
            dateTxtField.text = fixturesDate[row]
            self.view.endEditing(false)
        }
    }
}
