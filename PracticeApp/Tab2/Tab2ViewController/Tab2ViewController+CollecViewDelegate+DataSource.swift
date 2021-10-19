//
//  Tab2ViewController+CollecViewDelegate+DataSource.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 30/09/21.
//

import Foundation
import UIKit

extension Tab2ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GamesDB.data[section].count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = Tab2CollectionView.dequeueReusableCell(withReuseIdentifier: "Tab2CollectionViewCell", for: indexPath) as! Tab2CollectionViewCell
        //cell.CellImage.image=UIImage(named: "SurferImage2")
        //print(indexPath.row)
        //print(indexPath.item)
        //cell.backgroundColor = .blue
        
        print("ThumbNail_\([(indexPath.item)])")
        cell.CellImage.image=UIImage(named: "ThumbNail_\(GamesDB.data[indexPath.section][indexPath.item])")
        cell.cellLabel.text = GamesDB.data[indexPath.section][indexPath.item]
        cell.CellImage.layer.cornerRadius = 10
        //cell.CellImage.sizeToFit()
       // cell.CellImage.image?.size = CGSize(width: width, height: width)
    
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contentstoryboard = UIStoryboard(name: "ContentStoryboard", bundle: nil)
        let vc = contentstoryboard.instantiateViewController(withIdentifier: "ContentStoryboard") as! ContentStoryboard
        _ = vc.view
        self.navigationController?.pushViewController(vc, animated: true)
       // present(vc, animated: true, completion: nil)
        vc.DescriptionText.text = Tab1ViewModel.shared.randomtext
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = Tab2CollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Tab2HeaderCollectionReusableView", for: indexPath) as! Tab2HeaderCollectionReusableView
        header.headerLabel.text = GamesDB.sections[indexPath.section]
        return header
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return GamesDB.sections.count
    }
    
}
