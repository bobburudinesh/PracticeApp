//
//  FolderModel.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 25/10/21.
//

import Foundation
import UIKit
//["Cricket","Football","Basketball","Golf","Badminton","Hockey","Volleyball"]
class Section : Hashable{
    var id = UUID()
    var sectionTitle:String
    var folderItems:[FolderItem] = []
    init (title:String, items:[FolderItem]){
        self.sectionTitle = title
        self.folderItems = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
      }
    static func == (lhs: Section, rhs: Section) -> Bool {
        return rhs.id == lhs.id
    }

    
}


class FolderItem:Hashable{
   
    var itemTitle:String
    var ImageTitle:String
    var id = UUID()
    init(item:String,image:String){
        self.itemTitle = item
        self.ImageTitle = image
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
      }
    static func == (lhs: FolderItem, rhs: FolderItem) -> Bool {
        return rhs.id == lhs.id
    }
}



