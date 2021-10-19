//
//  ProfileTableViewCell.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 04/10/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileElementText: UILabel!
    @IBOutlet weak var ProfileElementLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // self.layer.cornerRadius = 12;
       // self.layer.masksToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
