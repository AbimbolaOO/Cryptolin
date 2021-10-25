//
//  OverviewViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit
import SideMenu

class OverviewViewController: UICollectionViewController {
    
    var menu: SideMenuNavigationController!
    
    lazy var topView: UIView = {
        let topView = UIView(frame: CGRect(x: 0, y: -collectionView!.bounds.height,
        width: collectionView!.bounds.width, height: collectionView!.bounds.height))
        topView.backgroundColor = .systemBlue
        return topView
    }()
    
    init(){
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection?  in
            switch sectionNumber{
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                return section
                
            case 1:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalWidth(1/4)))
                item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/4)), subitems: [item])
                group.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                
                let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
                let backgroundInset: CGFloat = 10
                backgroundItem.contentInsets = NSDirectionalEdgeInsets(top: backgroundInset, leading: backgroundInset, bottom: backgroundInset, trailing: backgroundInset)
                
                section.decorationItems = [backgroundItem]
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                return section
                
            case 2:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            default:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.50)), subitems: [item])
                group.contentInsets = .init(top: 8, leading: 10, bottom: 8, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
            
        }
        
        layout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background")
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.setupMenuViewController(MenuViewController.self, withIndentifier: MenuViewController.reuseIdentifier, menu: &menu, viewForGesture: view)
        
        collectionView!.addSubview(topView)
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(showMenu))
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.register(UINib(nibName: Section1CollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: Section1CollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: Section2CollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: Section2CollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: Section3CollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: Section3CollectionViewCell.reuseIdentifier)
        
        collectionView.showsVerticalScrollIndicator = false
        
    }

    @objc func showMenu(){
        present(menu, animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 8
        case 2:
            return 13
        default:
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Section1CollectionViewCell.reuseIdentifier, for: indexPath) as? Section1CollectionViewCell else {
                fatalError("Couldn't create cell at section 0")
            }
            return cell
        
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Section2CollectionViewCell.reuseIdentifier, for: indexPath) as? Section2CollectionViewCell else {
                fatalError("Couldn't create cell at section 0")
            }
            return cell
        
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Section3CollectionViewCell.reuseIdentifier, for: indexPath) as? Section3CollectionViewCell else {
                fatalError("Couldn't create cell at section 0")
            }
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
            cell.backgroundColor = .yellow
            return cell
        }
        
    }
    
}
