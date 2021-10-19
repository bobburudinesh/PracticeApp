//
//  RegistrationViewController.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 03/10/21.
//

import UIKit


class RegistrationViewController: UIViewController {

    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var RegistrationFileds: UITableView!
   
    @IBOutlet weak var registrationNavBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.RegisterButton.layer.cornerRadius = 5
        RegistrationFileds.delegate=self
        RegistrationFileds.dataSource=self
       // self.navigationItem.title = "Registration"
        
        // Do any additional setup after loading the view.
    }
    @IBAction func RegisterButtonPress() {
        DummyDatabase.Userid += 1
        DummyDatabase.Userdata[DummyDatabase.Userid]=[]
        print("Registered Successfully")
        print(DummyDatabase.FirstName)
        for i in 0..<6{
            let cell = self.RegistrationFileds.cellForRow(at: IndexPath(row: i, section: 0)) as! RegistrationElementCell
            if cell.RegistrationCellTextField.tag == i{
                if cell.RegistrationCellTextField.text! == ""{
                    
                    let alert = CredentialConstants.showalert(alertmessage: "Please Enter Valid \(CredentialConstants.RegistrationFields[i])", alerttitle: "Invalid \(CredentialConstants.RegistrationFields[i])", actiontitle: "Ok")
                    present(alert, animated: true, completion: nil)
                }else{
                    DummyDatabase.Userdata[DummyDatabase.Userid]?.append(cell.RegistrationCellTextField.text!)
                }
               
            }
        }
        
        print(DummyDatabase.Userdata)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = sb.instantiateViewController(identifier: "TabBar")
        mainTabBarController.modalPresentationStyle = .fullScreen
                self.present(mainTabBarController, animated: true, completion: nil)
       // DummyDatabase.defaults.setValue(true, forKey: "status")
        //defaults.setValue(false, forKey: "status")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
