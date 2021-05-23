//
//  LoginVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit
import Firebase


var isLoggedIn: Bool = false

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var loginLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    @IBOutlet weak var addPostLbl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        
    }
    
    
    
    @IBAction func logIn(_ sender: UIButton){
        
        if isLoggedIn{
            showAlert2(title: "Already Logged In", message: "You are already logged in")
        }else{
            Auth.auth().signIn(withEmail: loginLbl.text!, password: passwordLbl.text!) { (user, error) in
                
                if error != nil {
                   
                    self.showAlert2(title: "Invalid Username/Password", message: "Please enter a valid username and password.")
                   
                } else {
                    isLoggedIn = true
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            }
        }
    }
    
    
    
    
    
    
}
