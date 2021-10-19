//
//  ProfileViewController + TVDataScource +TVDelegate.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 04/10/21.
//

import Foundation
import UIKit
extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyDatabase.Userdata[1]!.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileElements.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        cell.ProfileElementLabel.text = CredentialConstants.RegistrationFields[indexPath.row]
        cell.ProfileElementText.text = DummyDatabase.Userdata[1]![indexPath.row]
        return cell
    }
    
    
    
    
}
