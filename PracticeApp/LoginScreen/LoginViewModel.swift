//
//  LoginViewModel.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 01/10/21.
//

import Foundation
import GoogleSignIn
class LoginManager{
    static let shared = LoginManager()
    private init(){}
    let signInConfig = GIDConfiguration.init(clientID: GoogleCredentials.oAuthClientId,serverClientID: GoogleCredentials.oAuthServerClientId)
    var username:String=""
    var password:String=""
    enum status{
        case Invalid
        case usernotfound
        case valid
    }
    func ValidateLength(name:String, id:String) -> Bool {
        let array = Array(name)
        if(array.count < CredentialConstants.MinimumUserNameLen && id == "username"){
            return false
        }else if(array.count < CredentialConstants.MinimunPasswordLen && id == "password"){
            return false
        }
        return true
    }
    
    func EncodePassword(name:String) -> String {
        var array = Array(name)
        for i in 0..<array.count{
            array[i]="*"
        }
        return String(array)
    }
    func Validate(name:String,pass:String) -> Bool {
        print(DummyDatabase.Userdata)
        if ((DummyDatabase.Userdata[1]?.isEmpty) != nil){
            
            return false
        }
        
        if (name == DummyDatabase.Userdata[1]![4] || name == DummyDatabase.Userdata[1]![2]) && (pass == DummyDatabase.Userdata[1]![5]) {
            return true
        }
        return false
    }
    
    /*if DummyDatabase.Userdata[1]! == []{
        return .usernotfound
    }
    
    if (name == DummyDatabase.Userdata[1]![4] || name == DummyDatabase.Userdata[1]![2]) && (pass == DummyDatabase.Userdata[1]![5]) {
        return .valid
    }
    return .Invalid
}*/
    
}
