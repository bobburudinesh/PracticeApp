//
//  RegistrationElementCell + TextFieldDelegate.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 03/10/21.
//

import Foundation
import UIKit
extension RegistrationElementCell:UITextFieldDelegate{
    /*func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 5{
            textField.text = CredentialsConstraints.EncodePassword(name: textField.text!)
        }
    }*/
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 5{
            textField.text = CredentialConstants.EncodePassword(name: textField.text!)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.tag == 2{
            if Array(textField.text!).count != 10{
               //var cons = CredentialsConstraints.showalert(alertmessage:"Please Enter Valid Phone Number" , alerttitle: "Invaid Mobile Number", actiontitle: "OK")
               // textField.text=""
              //  UIApplication.shared.keyWindow!.rootViewController!.present(cons, animated: true, completion: nil)
            }
        }else if textField.tag == 4{
            if Array(textField.text!).count < 8{
                //var cons = CredentialsConstraints.showalert(alertmessage: "Please Enter Username of Length More Than 8", alerttitle: "Invalid Username", actiontitle: "OK")
                //textField.text=""
                
               // UIApplication.shared.keyWindow!.rootViewController!.present(cons, animated: true, completion: nil)
            }
        }else if textField.tag == 5{
            if Array(textField.text!).count < 8{
               // var cons = CredentialsConstraints.showalert(alertmessage: "Please Enter Password of Length More Than 10", alerttitle: "Invalid Password", actiontitle: "OK")
              //  textField.text=""
               // UIApplication.shared.keyWindow!.rootViewController!.present(cons, animated: true, completion: nil)//
            }
        }
    }
}
