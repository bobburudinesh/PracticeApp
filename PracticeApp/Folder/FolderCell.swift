//
//  FolderCell.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 25/10/21.
//

import UIKit

class FolderCell: UICollectionViewCell {
    let label = UILabel()
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.backgroundColor = .blue
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension FolderCell{
    func configureView (){
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        contentView.addSubview(label)
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        //label.layer.borderWidth = 2
        //label.layer.borderColor = UIColor.black.cgColor
        //image.layer.cornerRadius = 10
        

        //image.layer.borderWidth = 1
        //image.layer.borderColor = UIColor.purple.cgColor
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.topAnchor.constraint(equalTo: image.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 20.0)
        ]
        )
    }
}
