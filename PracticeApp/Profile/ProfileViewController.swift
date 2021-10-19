//
//  ProfileViewController.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 04/10/21.
//

import UIKit
import GoogleSignIn
import DropDown


class ProfileViewController: UIViewController {

    let dropDown = DropDown()
    @IBOutlet weak var ProfilePageActionButton: UIBarButtonItem!
    @IBOutlet weak var ProfilePageNavBar: UINavigationItem!
    @IBOutlet weak var ProfilePicture: UIImageView!
    //@IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var ProfileElements: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.dataSource = ProfilePageConstants.dropDownContents
        //dropDown.anchorView = navigationController?.navigationBar.plainView
        dropDown.anchorView = ProfilePageActionButton
        dropDown.cornerRadius = 20
    
    
        //dropDown.layer.cornerCurve = .circular
        dropDown.width = 150
        dropDown.bottomOffset = CGPoint(x: 0, y: (self.dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            if index == 0 {
                print("For Editing")
               // let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
               // self.present(vc, animated: true, completion: nil)
                //vc.modalPresentationStyle = .fullScreen
                //self.navigationController?.pushViewController(vc, animated: true)
                //self.present(vc, animated: true, completion: nil)
                _ = vc.view
                vc.registrationNavBar.isHidden = true
                vc.view.addConstraint(NSLayoutConstraint(item: vc.view, attribute: .top, relatedBy: .equal, toItem: vc.RegistrationFileds, attribute: .top, multiplier: 1, constant: 0))
                self.navigationController?.pushViewController(vc, animated: true)
                vc.navigationItem.title = "Edit Profile"
                //vc.registrationNavBar.isTranslucent = true
                
                
               /* vc.registrationNavBar.topItem?.title = "Edit Profile"
                vc.registrationNavBar.backgroundColor = UIColor.blue*/
                vc.RegisterButton.setTitle("Save", for: .normal)
                
                
                
                

                
            }else if index == 1 {
                GIDSignIn.sharedInstance.signOut()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let LoginViewController = storyboard.instantiateViewController(identifier: "LoginViewController")
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController = LoginViewController
            }else {
                print("Display Version")
            }
        }
        
        ProfileElements.delegate=self
        ProfileElements.dataSource=self
        ProfileElements.clipsToBounds = true
        ProfileElements.layer.cornerRadius = 20
        ProfileElements.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
       // ProfilePicture.layer.cornerRadius = 50
        
        // Do any additional setup after loading the view.
    }
    @IBAction func settingsButtonPress() {
        //let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController")
        //navigationController?.pushViewController(sb, animated: true)
        dropDown.show()
        
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
