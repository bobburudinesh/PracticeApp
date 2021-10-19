//
//  Constants.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 01/10/21.
//

import Foundation
import UIKit
import AVFoundation

struct CredentialConstants{
    static let RegistrationFields:[String] = ["First Name","Last Name","Mobile Number","Email","Usename","Password"]
    static let RegistrationFieldContentType:[UITextContentType]=[.name,.name,.telephoneNumber,.emailAddress,.username,.password]
    static let MinimumUserNameLen:Int = 6
    static let MinimunPasswordLen:Int = 8
    static let InsufficientsUsernameLength:String="Invalid Username"
    static let InsufficientsPasswordLength:String="Invalid Passsword"
    static func showalert(alertmessage:String,alerttitle:String,actiontitle:String) -> UIAlertController {
        let alert = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: UIAlertController.Style.alert)
        let OkAction = UIAlertAction(title: actiontitle, style: .default, handler: nil)
        alert.addAction(OkAction)
        return alert
    }
    static func EncodePassword(name:String) -> String {
        var array = Array(name)
        for i in 0..<array.count{
            array[i]="*"
        }
        return String(array)
    }
    
    
}





struct DummyDatabase{
    static let defaults = UserDefaults.standard
    static var Userid:Int=0
    static var authToken:[String?] = [""]
    static var Userdata:[Int:[String]]=[0 : [],1:["Dinesh", "Bobburu","9652160530","bobburud@gmail.com","dineshbobburu","*************"]] //Each value follows Registration Pattern
    static var FirstName:[String]=[]
    static var LastName:[String]=[]
    static var MobileNumber:[String]=[]
    static var Email:[String]=[]
    static var Username:[String]=[]
    static var Password:[String]=[]
}

//Structures
struct User{
    var Name:String=""
    var Password:String=""
    
}

// GooleSignIn
struct GoogleCredentials{
    static let oAuthClientId:String = "1001386316698-qbtjoqskkadcga52sicd4rs7j6b18frv.apps.googleusercontent.com"
    static let oAuthServerClientId:String = "1001386316698-1fcafpprpc3he3ic1gtvtpodm4tsoneg.apps.googleusercontent.com"
}

//ProfilePage
struct ProfilePageConstants{
    static let dropDownContents:[String] = ["Edit Profile","Logout","Information"]
}

//GamesDatabase
struct GamesDB{
    
    static var sections:[String] = ["Bookmarks","Games"]
    static var bookmarkedGames:[String]=[]
    static var games:[String]=["Cricket","Football","Basketball","Golf","Badminton","Hockey","Volleyball"]
    static var data : [[String]] = [["Cricket","Football","Basketball"],["Cricket","Football","Basketball","Golf","Badminton","Hockey","Volleyball"]]
    //static var data:[String:[String]] = ["games":["Cricket","Football","Basketball","Golf","Badminton","Hockey","Volleyball"],"sections":["Games","Bookmarks"],"bookmarkedGames":[]]
   /* init (){
        GamesDB.data.updateValue(GamesDB.sections, forKey: "sections")
        GamesDB.data.updateValue(<#T##value: [String]##[String]#>, forKey: <#T##String#>)
    }*/
    
}

