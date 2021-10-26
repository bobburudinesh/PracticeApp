//
//  Tab1ViewController.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 28/09/21.
//

import UIKit
import GoogleSignIn
class Tab1ViewController: UIViewController {
    let screenMultiplier = 0.8
    @IBOutlet weak var tab1CV: UICollectionView!
    @IBOutlet weak var Tab1Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Tab1Table.delegate=self
        Tab1Table.dataSource=self
        tab1CV.dataSource = self
        //tab1CV.delegate = self
        
        //let screenSize = UIScreen.main.bounds.size
        
    }
}

extension Tab1ViewController : IndexpathDelegation{
    func getIndexPathFromCell (_ cell : Tab1TableViewCell){
        if let indexPath = Tab1Table.indexPath(for: cell){
            if indexPath.section == 0{
                GamesDB.data[1].append(GamesDB.data[indexPath.section][indexPath.item])
                GamesDB.data[indexPath.section].remove(at: indexPath.item)
                self.Tab1Table.beginUpdates()
                self.Tab1Table.moveRow(at: indexPath, to: IndexPath.init(row: (GamesDB.data[1].count-1), section: 1))
                self.Tab1Table.endUpdates()
            }else if indexPath.section == 1{
                GamesDB.data[0].append(GamesDB.data[indexPath.section][indexPath.item])
                GamesDB.data[indexPath.section].remove(at: indexPath.item)
                //self.Tab1Table.beginUpdates()
                self.Tab1Table.moveRow(at: indexPath, to: IndexPath.init(row: (GamesDB.data[0].count-1), section: 0))
                //self.Tab1Table.endUpdates()
                self.Tab1Table.reloadData()
            }
        }
    }
}

