//
//  WalletViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit

class WalletViewController: UICollectionViewController{
    
    init(){
        let layout = UICollectionViewCompositionalLayout{(sectionNumber, _) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25)), subitems: [item])
            group.contentInsets = .init(top: 8, leading: 10, bottom: 8, trailing: 10)
            
            let section = NSCollectionLayoutSection(group: group)
            
            let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(104))
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
            headerItem.contentInsets = .init(top: 10, leading: 0, bottom: 10, trailing: 0)
            
            section.boundarySupplementaryItems = [headerItem]
            
            let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
            let backgroundInset: CGFloat = 10
            backgroundItem.contentInsets = NSDirectionalEdgeInsets(top: backgroundInset, leading: backgroundInset, bottom: backgroundInset, trailing: backgroundInset)
            
            section.decorationItems = [backgroundItem]
            section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            return section
            
        }
        
        layout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background")
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
        
        collectionView.register(UINib(nibName: WalletCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: WalletCollectionViewCell.reuseIdentifier)
        
        collectionView.register(WalletHeaderCollectionViewCell.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: WalletHeaderCollectionViewCell.reuseIdentifier)
        
        collectionView.showsVerticalScrollIndicator = false
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCollectionViewCell.reuseIdentifier, for: indexPath) as? WalletCollectionViewCell else {fatalError("Couldn't create cell")}
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WalletHeaderCollectionViewCell.reuseIdentifier, for: indexPath) as? WalletHeaderCollectionViewCell else {
            fatalError("Couldn't create view")
        }
        return headerView
    }
    
}
