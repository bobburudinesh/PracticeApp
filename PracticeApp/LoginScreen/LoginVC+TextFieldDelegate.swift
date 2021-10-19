//
//  LoginVC+TextFieldDelegate.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 01/10/21.
//

import Foundation
import UIKit
extension LoginViewController:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == UserNameField{
            print("user")
            if(!LoginManager.shared.ValidateLength(name: (textField.text)!,id: "username") && (UserNameField.text != "")) {
                /* let alert = UIAlertController(title: "Error", message: "Please Enter Username of Length More Than 6 Characters", preferredStyle: UIAlertController.Style.alert)
                let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(OkAction)*/
                let alert = CredentialConstants.showalert(alertmessage: "Please Enter Username of Length More Than 6 Characters", alerttitle: "Error", actiontitle: "OK")
                present(alert, animated: true, completion: {textField.text=""})
            } else {
                LoginManager.shared.username = textField.text!
                UserNameField.text=textField.text!
            }
            
        }else if textField == passwordField{
            if(!LoginManager.shared.ValidateLength(name: (textField.text)! , id: "password") && (passwordField.text != "")) {
                
                let alert = CredentialConstants.showalert(alertmessage:"Please Enter Password of Length More Than 8 Characters" , alerttitle: "Error", actiontitle: "OK")
                present(alert, animated: true, completion: {textField.text=""})
            }else {
                LoginManager.shared.password = (textField.text)!
                passwordField.text = LoginManager.shared.EncodePassword(name: (textField.text)!)
            }
            
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordField {
            LoginManager.shared.password = (textField.text)!
            passwordField.text = LoginManager.shared.EncodePassword(name: (textField.text)!)
        }
        
    }
}
