//
//  RegistrationViewController+TVDatasource+TVDelegate.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 03/10/21.
//

import Foundation
import UIKit
extension RegistrationViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CredentialConstants.RegistrationFields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RegistrationFileds.dequeueReusableCell(withIdentifier: "RegistrationElementCell") as! RegistrationElementCell
        cell.RrgistrationCellLabel.text = CredentialConstants.RegistrationFields[indexPath.row]
        cell.RegistrationCellTextField.placeholder = CredentialConstants.RegistrationFields[indexPath.row]
        cell.RegistrationCellTextField.tag = indexPath.row
        cell.RegistrationCellTextField.textContentType = CredentialConstants.RegistrationFieldContentType[indexPath.row]
        return cell
    }
    
}
