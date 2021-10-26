//
//  FolderViewController.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 25/10/21.
//

import UIKit

class FolderViewController: UIViewController {
    
    var dataSource:UICollectionViewDiffableDataSource<Section,FolderItem>! = nil
    var collectionView:UICollectionView! = nil
    
    
    var localDataSource:[Section] = [Section(title: "Images", items: [FolderItem(item: "Cricket", image: "Cricket"),FolderItem(item: "Football", image: "Football"),FolderItem(item: "Basketball", image: "Basketball"),FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Badminton", image: "Badminton"),FolderItem(item: "Hockey", image: "Volleyball")]),Section(title: "Cricket", items: [FolderItem(item: "Cricket", image: "Cricket"),FolderItem(item: "Cricket", image: "Cricket"),FolderItem(item: "Cricket", image: "Cricket"),FolderItem(item: "Cricket", image: "Cricket"),FolderItem(item: "Cricket", image: "Cricket")]),Section(title: "Golf", items: [FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Golf", image: "Golf"),FolderItem(item: "Golf", image: "Golf")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewHierarchy()
        configgureDataSource()

        // Do any additional setup after loading the view.
    }
    func createLayout() -> UICollectionViewLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        //section.interGroupSpacing = 10.0
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func configureViewHierarchy(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    func configgureDataSource(){
        let cellRegistered = UICollectionView.CellRegistration<FolderCell,FolderItem>{cell,indexPath,itemIdentifier in
            cell.contentView.layer.cornerRadius = 10
            cell.label.text = itemIdentifier.itemTitle
            cell.image.image = UIImage(named: "ThumbNail_\(itemIdentifier.ImageTitle)")
            cell.image.contentMode = .scaleToFill
            cell.contentView.backgroundColor = .white
            
            
        }
        dataSource = UICollectionViewDiffableDataSource<Section,FolderItem>(collectionView: collectionView){(collectionView,indexPath,itemIdentifier) -> UICollectionViewCell in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistered, for: indexPath, item: itemIdentifier)
        }
        var currentSnapshot = NSDiffableDataSourceSnapshot<Section,FolderItem>()
        
        localDataSource.forEach{
            let collection = $0
            currentSnapshot.appendSections([collection])
            
            currentSnapshot.appendItems(collection.folderItems, toSection: collection)
            
        }
        dataSource.apply(currentSnapshot)
        
    }
    
}
