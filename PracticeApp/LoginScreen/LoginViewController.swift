//
//  LoginViewController.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 01/10/21.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
class LoginViewController: UIViewController {
    @IBOutlet weak var facebookSignInButton: FBLoginButton!
    @IBOutlet weak var GoogleSignInButton: GIDSignInButton!
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var CreateAccountButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Settings.setAdvertiserTrackingEnabled(false)
        Settings.isAutoLogAppEventsEnabled = false
        Settings.isAdvertiserIDCollectionEnabled = false
        UserNameField.delegate=self
        passwordField.delegate=self
        //GoogleSignInButton.layer.frame = CG
        GoogleSignInButton.style = .iconOnly
        // Do any additional setup after loading the view.
    }
    @IBAction func signIn(sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: LoginManager.shared.signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            print("Sign IN Succeded")
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = sb.instantiateViewController(identifier: "TabBar")
            mainTabBarController.modalPresentationStyle = .fullScreen
            self.present(mainTabBarController, animated: true, completion: nil)
            DummyDatabase.Userdata[1]![3] = user.profile?.email ?? "No Email Found"
            DummyDatabase.Userdata[1]![0] = user.profile?.name ?? "No First Name"
            // let givenName = user.profile?.givenName
            //let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            DummyDatabase.Userdata[1]![1] = user.profile?.familyName ?? "No Last Name"
            DummyDatabase.authToken.append(user.serverAuthCode)
            user.authentication.do { authentication, error in
                guard error == nil else { return }
                guard let authentication = authentication else { return }
                if let idToken = authentication.idToken{
                    print("ID TOKEN : \(idToken)")
                    // Send ID token to backend (example below).
                }
            }
            // If sign in succeeded, display the app's main content View.
        }
    }
    @IBAction func LoginButtonPress() {
        /*if (UserNameField.text == DummyDatabase.Userdata[1]![4] && passwordField.text == DummyDatabase.Userdata[1]![5]){
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = sb.instantiateViewController(identifier: "TabBar")
            mainTabBarController.modalPresentationStyle = .fullScreen
            self.present(mainTabBarController, animated: true, completion: nil)
        }else if (UserNameField.text != DummyDatabase.Userdata[1]![4] && passwordField.text != DummyDatabase.Userdata[1]![5]){
            let alert = CredentialConstants.showalert(alertmessage: "Please Enter Valid Username or Password", alerttitle: "Invalid Username or Password", actiontitle: "OK")
            present(alert, animated: true, completion: {self.UserNameField.text = "";self.passwordField.text = ""})
        }else if(DummyDatabase.Userdata[1] ==  nil){
            let alert = CredentialConstants.showalert(alertmessage: "User Not Found", alerttitle: "Invalid User", actiontitle: "OK")
            present(alert, animated: true, completion: {self.UserNameField.text = "";self.passwordField.text = ""})
        }*/
        
        //For testing only
        let sb = UIStoryboard(name: "Main", bundle: nil)
         let mainTabBarController = sb.instantiateViewController(identifier: "TabBar")
         mainTabBarController.modalPresentationStyle = .fullScreen
         self.present(mainTabBarController, animated: true, completion: nil)
        
    }
    @IBAction func CreateAccountButtonPress() {
        print("to be navigated")
        
        //   ---> Present and Navigationcontroller
        /*let sb = UIStoryboard(name: "Main", bundle: nil)
         let vc = sb.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
         // present(vc, animated: true, completion: nil)
         
         self.navigationController?.pushViewController(vc, animated: true)*/
        
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let RegistrationScreen = sb.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        
        RegistrationScreen.modalPresentationStyle = .fullScreen
        self.present(RegistrationScreen, animated: true, completion: nil)
        //RegistrationScreen.registrationNavBar.topItem?.title = "Registration"
        self.navigationItem.title = "Registration"
        // navigationController?.pushViewController(RegistrationViewController(), animated: true)
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
