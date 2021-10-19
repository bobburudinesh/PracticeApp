//
//  RegistrationElementCell.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 03/10/21.
//

import UIKit

class RegistrationElementCell: UITableViewCell {

    @IBOutlet weak var RegistrationCellTextField: UITextField!
    @IBOutlet weak var RrgistrationCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        RegistrationCellTextField.delegate=self
        /*self.RegistrationCellTextField.layer.borderColor=UIColor.black.cgColor
        self.RegistrationCellTextField.layer.borderWidth=1
        self.RegistrationCellTextField.layer.cornerRadius=10*/
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
/*
extension RegistrationElementCell:UITextFieldDelegate{
    /*func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 5{
            textField.text = CredentialsConstraints.EncodePassword(name: textField.text!)
        }
    }*/
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 5{
            textField.text = CredentialsConstraints.EncodePassword(name: textField.text!)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 2{
            if Array(textField.text!).count != 10{
               var cons = CredentialsConstraints.showalert(alertmessage:"Please Enter Valid Phone Number" , alerttitle: "Invaid Mobile Number", actiontitle: "OK")
                textField.text=""
                UIApplication.shared.keyWindow!.rootViewController!.present(cons, animated: true, completion: nil)
            }
        }else if textField.tag == 4{
            if Array(textField.text!).count < 8{
                var cons = CredentialsConstraints.showalert(alertmessage: "Please Enter Username of Length More Than 8", alerttitle: "Invalid Username", actiontitle: "OK")
                textField.text=""
                UIApplication.shared.keyWindow!.rootViewController!.present(cons, animated: true, completion: nil)
            }
        }else if textField.tag == 5{
            if Array(textField.text!).count < 8{
                var cons = CredentialsConstraints.showalert(alertmessage: "Please Enter Password of Length More Than 10", alerttitle: "Invalid Password", actiontitle: "OK")
                textField.text=""
                UIApplication.shared.keyWindow!.rootViewController!.present(cons, animated: true, completion: nil)
            }
        }
    }
}
*/
