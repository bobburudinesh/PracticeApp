//
//  Tab2VC+CollectionViewDelegateFlowLayout.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 18/10/21.
//

import Foundation
import UIKit

extension Tab2ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/3
        return CGSize(width: width, height: width)
    }
    
}
