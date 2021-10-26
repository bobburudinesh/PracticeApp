//
//  Tab1VC+CVDataSource+CVDelegate.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 19/10/21.
//

import Foundation
import UIKit

extension Tab1ViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GamesDB.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tab1CV.dequeueReusableCell(withReuseIdentifier: "Tab1CollectionViewCell", for: indexPath) as! Tab1CollectionViewCell
        cell.carouselImage.image = UIImage(named: "ThumbNail_\(GamesDB.games[indexPath.item])")
        cell.carouselImage.layer.cornerRadius = 10
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let carouselCellWidth = floor(self.tab1CV.frame.width * 1)
       // let carouselCellHeight = floor(self.tab1CV.frame.height * 1)
        let width = self.view.frame.width
        return CGSize(width: width, height: width*0.6)
    }
    
}

