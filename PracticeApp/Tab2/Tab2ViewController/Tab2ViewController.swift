//
//  Tab2ViewController.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 29/09/21.
//

import UIKit

class Tab2ViewController: UIViewController {

    @IBOutlet weak var Tab2CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Tab2CollectionView.delegate=self
        Tab2CollectionView.dataSource=self
        Tab2CollectionView.reloadData()

        // Do any additional setup after loading the view.
    }
    


}

class Tab2CollectionViewCell:UICollectionViewCell{
    
    @IBOutlet weak var CellImage: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    

}
