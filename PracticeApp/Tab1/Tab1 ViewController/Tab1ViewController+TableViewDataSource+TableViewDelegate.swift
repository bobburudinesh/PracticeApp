//
//  Tab1ViewController+TableViewDataSource+TableViewDelegate.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 28/09/21.
//

import Foundation
import UIKit

extension Tab1ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GamesDB.data[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        GamesDB.sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return GamesDB.sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tab1Table.dequeueReusableCell(withIdentifier: "tab1tableviewcell") as! Tab1TableViewCell
        cell.ContentLabel.text = GamesDB.data[indexPath.section][indexPath.item]
        cell.ContentLabel.textAlignment = .center
        cell.thumbnailImage.image = UIImage(named: "ThumbNail_\(GamesDB.data[indexPath.section][indexPath.item])")
        cell.indexPathDlegate = self
        if indexPath.section == 0{
            cell.knowMoreButton.setImage(UIImage.remove, for: .normal)
            cell.knowMoreButton.setTitle("Remove", for: .normal)
        }else if indexPath.section == 1{
            cell.knowMoreButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            cell.knowMoreButton.setTitle("Bookmark", for: .normal)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.Tab1Table.frame.width/3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentstoryboard = UIStoryboard(name: "ContentStoryboard", bundle: nil)
        let vc = contentstoryboard.instantiateViewController(withIdentifier: "ContentStoryboard") as! ContentStoryboard
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .phone ? 25 : 40
    }
}
