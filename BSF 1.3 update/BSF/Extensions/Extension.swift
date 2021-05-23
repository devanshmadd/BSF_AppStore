//
//  Extension.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//
import UIKit

extension Formatter {
    static let monthMedium: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLL"
        return formatter
    }()
    static let hour12: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h"
        return formatter
    }()
    static let minute0x: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        return formatter
    }()
    static let amPM: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        return formatter
    }()
    static let day: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()
    static let year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy"
        return formatter
    }()
}
extension Date {
    var monthMedium: String  { return Formatter.monthMedium.string(from: self) }
    var hour12:  String      { return Formatter.hour12.string(from: self) }
    var minute0x: String     { return Formatter.minute0x.string(from: self) }
    var ampm: String         { return Formatter.amPM.string(from: self) }
    var year: String         { return Formatter.year.string(from: self) }
    var day: String          { return Formatter.day.string(from: self) }
}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        
        let alertCancel = UIAlertAction(title: "Close App", style: .cancel) { (action) in
            exit(0)
        }
        alert.addAction(alertCancel)
        self.present(alert, animated: true)
        
    }
    
    func showAlert2(title: String, message: String){
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        
        let alertCancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(alertCancel)
        self.present(alert, animated: true)
    }
    
    
    
    func daySelected(dateID: Int)->String{
        switch dateID {
        case 1:
            return "day0"
            
        case 2:
            return "day1"
            
        case 3:
            return "day2"
            
        case 4:
            return "day3"
            
        case 5:
            return "day4"
            
        case 6:
            return "day5"
        default:
            return ""
        }
    }
    
    func resultDaySelected(dateID: Int)->String{
        switch dateID {
        case 1:
            return "resultday0"
            
        case 2:
            return "resultday1"
            
        case 3:
            return "resultday2"
            
        case 4:
            return "resultday3"
            
        case 5:
            return "resultday4"
            
        case 6:
            return "resultday5"
            
        default:
            return ""
        }
    }
    
    func stopPlayingVideo(){
         avPlayerViewController.player?.pause()
    }
}


