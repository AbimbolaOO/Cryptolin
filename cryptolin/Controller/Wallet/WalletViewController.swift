//
//  WalletViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit
import SideMenu

class WalletViewController: UICollectionViewController{
    
    var menu: SideMenuNavigationController!
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    init(){
        let layout = UICollectionViewCompositionalLayout{(sectionNumber, _) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
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
        
        collectionView.backgroundColor = .systemBackground
        
        Utils.setupMenuViewController(MenuViewController.self, withIndentifier: MenuViewController.reuseIdentifier, menu: &menu, viewForGesture: view)
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(showMenu))
        
        collectionView.register(UINib(nibName: WalletCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: WalletCollectionViewCell.reuseIdentifier)
        
        collectionView.register(WalletHeaderCollectionViewCell.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: WalletHeaderCollectionViewCell.reuseIdentifier)
        
        collectionView.showsVerticalScrollIndicator = false
        
    }
    
    @objc func showMenu(){
        present(menu, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WalletAddressData.listOfWalletAddressInfo.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCollectionViewCell.reuseIdentifier, for: indexPath) as? WalletCollectionViewCell else {fatalError("Couldn't create cell")}
        cell.setUpWalletAddressCellInfo = WalletAddressData.listOfWalletAddressInfo[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WalletHeaderCollectionViewCell.reuseIdentifier, for: indexPath) as? WalletHeaderCollectionViewCell else {
            fatalError("Couldn't create view")
        }
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        if let vc = storyBoard.instantiateViewController(withIdentifier: WalletViewCellTapedViewController.storyboardId) as? WalletViewCellTapedViewController{
            vc.navigationItem.title = creatNavTitleForWalletView(indexPathItem: indexPath.item)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func creatNavTitleForWalletView(indexPathItem: Int) -> String{
        let getBalanceComponents = WalletAddressData.listOfWalletAddressInfo[indexPathItem].balance.components(separatedBy: " ")
        let abbr = getBalanceComponents[1]
        return "\(abbr) Addresses"
    }
    
}
