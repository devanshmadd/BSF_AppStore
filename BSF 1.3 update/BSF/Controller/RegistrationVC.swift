//
//  RegistrationVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import UIKit
import SafariServices

class RegistrationVC: UIViewController {

    @IBOutlet weak var stepsLbl: UILabel!
    @IBOutlet weak var msgLBl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stepsLbl.text = "1) Start by visiting our website, (Link Below)\n\n2) Click on Registrations (You will be redirected to the registration link) Now, click on REGISTER and fill in your details. \n\n3) Finally, create a username and password for your university."
        
        msgLBl.text = "Important: Note that the registration for your university needs to be done under one centralized username and password. The registartion for different sports is supposed to be under same account.\n The last day for Registering and Adding Events is November 12, 2019!\n Please note that the link will be blocked after that and editing will not be permitted. "
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         stopPlayingVideo()
    }
    
    @IBAction func btnPressed(_ sender: Any){
//        guard let url = URL(string: "http://www.bitssportsfestival.org/") else { return }
//        UIApplication.shared.open(url)
        
        guard let url = URL(string: "http://www.bitssportsfestival.org/") else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    


}


extension RegistrationVC: SFSafariViewControllerDelegate{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
