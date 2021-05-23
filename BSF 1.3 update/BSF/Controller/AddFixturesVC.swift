//
//  AddFixturesVC.swift
//  BSF
//
//  Created by Harshit Gajjar on 10/26/19.
//  Copyright © 2019 ThinkX. All rights reserved.
//

import UIKit
import Firebase

class AddFixturesVC: UIViewController,UITextFieldDelegate {

    
    //Outlets here..
    @IBOutlet weak var team1TxtField: UITextField!
    @IBOutlet weak var team2TxtField: UITextField!
    @IBOutlet weak var venueTxtField: UITextField!
    @IBOutlet weak var timeTxtField: UITextField!
    @IBOutlet weak var matchNumberTxtField: UITextField!
    
    var tf: String!
    var date: Int!
    var categorySelected: Int!
    
    var matchadd: MatchDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "\(matchadd.sportName) \(matchadd.sportCategory)"
        team2TxtField.delegate = self
        team1TxtField.delegate = self
        
        team1TxtField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        team2TxtField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == team1TxtField{
            tf = team1TxtField.text
        }else if textField == team2TxtField{
            tf = team2TxtField.text
        }
        
        guard let textFieldText = tf,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 35
    }
    
    
    @IBAction func addFixtureToFirebase(_ sender: Any) {
        
        if checkData(){
            let newFixturesPost = Database.database().reference().child("Fixtures").child(matchadd.date).child(matchadd.sportName).child(matchadd.sportCategory).childByAutoId()
            
            let fixturesData = ["team1": team1TxtField.text!,
                                "team2": team2TxtField.text!,
                                "venue": venueTxtField.text!,
                                "time": timeTxtField.text!,
                                "number": matchNumberTxtField.text!]
            
            newFixturesPost.setValue(fixturesData)
            print("Data saved successfully")
            self.navigationController?.popViewController(animated: true)
        }else{
            showAlert2(title: "Missing details in all fields", message: "Please enter value in all fields to proceed further.")
        }
    }
    
    
    func checkData()->Bool{
        if team1TxtField.text != "" && team2TxtField.text != "" && venueTxtField.text != "" && matchNumberTxtField.text != "" && timeTxtField.text != "" {
            return true
        }
        
        return false
    }

}


    

