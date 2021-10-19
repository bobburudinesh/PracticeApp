//
//  Tab1TableViewCell.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 18/10/21.
//

import UIKit

protocol IndexpathDelegation{
    func getIndexPathFromCell (_ cell : Tab1TableViewCell)
}

class Tab1TableViewCell: UITableViewCell {
    var indexPathDlegate:IndexpathDelegation?
    @IBOutlet weak var knowMoreButton: UIButton!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.thumbnailImage.layer.cornerRadius = 10
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func bookmarkButtonPressed(_ sender:AnyObject){
        // print(path.row)
        indexPathDlegate?.getIndexPathFromCell(self)
    }
    
}
