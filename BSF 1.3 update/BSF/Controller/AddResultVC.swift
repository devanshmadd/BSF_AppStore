//
//  AddResultVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

class AddResultVC: UIViewController,UITextFieldDelegate {
    
    var tf: String!
    
    @IBOutlet weak var team1TxtField: UITextField!
    @IBOutlet weak var team2TxtField: UITextField!
    @IBOutlet weak var resultTxtField: UITextField!
    @IBOutlet weak var matchNumTxtField: UITextField!
  
    var date: Int!
    var categorySelected: Int!
    
    var resultadd: MatchDetails!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        self.navigationItem.title = "\(resultadd.sportName) \(resultadd.sportCategory)"
        
        team1TxtField.delegate = self
        team2TxtField.delegate = self
        
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
    
    
    
    @IBAction func btnPressed(_ sender: Any){
        
        if checkDataInFields(){
            let newResultRef = Database.database().reference().child("Results").child(resultadd.date).child(resultadd.sportName).child(resultadd.sportCategory).childByAutoId()

            let newResultDict = ["team1": team1TxtField.text!, "team2": team2TxtField.text!, "result_string": resultTxtField.text!, "number": matchNumTxtField.text!]

            newResultRef.setValue(newResultDict)
            self.navigationController?.popViewController(animated: true)
        }else{
            showAlert2(title: "Missing details in all fields", message: "Please enter value in all fields to proceed further.")
        }
    }
    
    
    func checkDataInFields()->Bool{
        if team1TxtField.text != "" && team2TxtField.text != "" && matchNumTxtField.text != "" && resultTxtField.text != ""{
            return true
        }
        
        return false
    }
    


}

