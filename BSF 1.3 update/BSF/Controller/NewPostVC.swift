//
//  NewPostVC.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//
import UIKit


class NewPostVC: UIViewController {

    @IBOutlet weak var postContent: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postCategory: UITextField!
    
    var categoryData = ["general", "football", "basketball", "cricket", "badminton", "tennis", "table_tennis", "chess", "athletics", "throwball", "volleyball"]
    
    let categoryPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        // for picker view
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        // Code below is to limit characters of textfield
        postTitle.delegate = self
        postTitle.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        postCategory.inputView = categoryPicker
        
        

        postImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openGallery)))
        postImage.isUserInteractionEnabled = true
    }
    
    ///Opens gallery to select image to upload
    @objc func openGallery(){
       let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func uploadPostToFirebase(_ sender: Any) {
        if postContent.text != "" && postTitle.text != "" && postImage != nil && postCategory.text != ""{

            let newPost = Post(image: postImage.image!, caption: postContent.text, title: postTitle.text!, timestamp: makeDateForTimeStamp(),sport: postCategory.text!)
            newPost.save()
            self.navigationController?.popToRootViewController(animated: true)
        }else{
            showAlert2(title: "Missing details in all fields", message: "Please enter value in all fields to proceed further.")
        }
    }
    
    
    func makeDateForTimeStamp() -> String{
        
       let date = Date()
        
        if date.ampm == "PM"{
           let abc = Int("\(date.hour12)")! + 12
            return "\(date.day)-\(date.monthMedium)-\(date.year) at \(abc):\(date.minute0x) \(date.ampm)"
        }else{
            return "\(date.day)-\(date.monthMedium)-\(date.year) at \(date.hour12):\(date.minute0x)\(date.ampm)"
        }
        
    }
    
    func timeConversion24(time12: String) -> String {
        let dateAsString = time12
        let df = DateFormatter()
        df.dateFormat = "hh"

        let date = df.date(from: dateAsString)
        df.dateFormat = "HH"

        let time24 = df.string(from: date!)
        print(time24)
        return time24
    }
    
}

extension NewPostVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage]{
            postImage.image = editedImage as? UIImage
        }else if let originalImage = info[.originalImage]{
            postImage.image = originalImage as? UIImage
        }
        self.dismiss(animated: true, completion: nil)
    }
}


extension NewPostVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = postTitle.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 45
    }
    
    
}

extension NewPostVC: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        postCategory.text = categoryData[row]
        self.view.endEditing(false)
        
    }
    
    
    
}
