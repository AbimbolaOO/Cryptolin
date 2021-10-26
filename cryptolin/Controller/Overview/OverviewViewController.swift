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

    var sections = OverviewTabViewData.Section.allCases
    private lazy var diffDataSource = makeDiffableDataSource()
    typealias DataSource = UICollectionViewDiffableDataSource<OverviewTabViewData.Section, AnyHashable>
    typealias Snapshot = NSDiffableDataSourceSnapshot<OverviewTabViewData.Section, AnyHashable>
    
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
                section.contentInsets = .init(top: 10, leading: 10, bottom: 5, trailing: 10)
                
                return section
            
            case 2:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                group.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
                
            case 3:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
                
            case 4:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            
            case 5:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(320)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)

                return section
                
            default:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)), subitems: [item])
                group.contentInsets = .init(top: 5, leading: 10, bottom: 10, trailing: 10)
                
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
        collectionView.backgroundColor = .init(white: 0.98, alpha: 1)
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(showMenu))
        
        collectionView.register(UINib(nibName: YourBalanceCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: YourBalanceCollectionViewCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName: TopStacticViewGroupCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: TopStacticViewGroupCollectionViewCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName: CryptoPortfolioSummaryCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CryptoPortfolioSummaryCollectionViewCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName: CryptoCellsCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CryptoCellsCollectionViewCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName: AddWalletCellCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: AddWalletCellCollectionViewCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName:  PriceHistoryCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier:  PriceHistoryCollectionViewCell.reuseIdentifier)
        
        collectionView.register(UINib(nibName: PassiveIncomeViewCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PassiveIncomeViewCollectionViewCell.reuseIdentifier)
        
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        
        collectionView.showsVerticalScrollIndicator = false
        applySnapshot()
    }

    @objc func showMenu(){
        present(menu, animated: true, completion: nil)
    }
    
    func makeDiffableDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, object) -> UICollectionViewCell? in
            if let object = object as? YourBalance{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YourBalanceCollectionViewCell.reuseIdentifier, for: indexPath) as? YourBalanceCollectionViewCell else {fatalError("Wasn't succesful")}
                cell.balance.text = object.balance
                cell.backgroundColor = .systemBlue
                return cell
            }
            if let object = object as? TopStacticViewGroup{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopStacticViewGroupCollectionViewCell.reuseIdentifier, for: indexPath) as? TopStacticViewGroupCollectionViewCell else {fatalError("Wasn't succesful")}
                cell.image.image = object.image
                cell.label.text = object.label
                return cell
            }
            
            if let object = object as? CryptoPortfolioSummary{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CryptoPortfolioSummaryCollectionViewCell.reuseIdentifier, for: indexPath) as? CryptoPortfolioSummaryCollectionViewCell else {fatalError("Wasn't succesful")}
                return cell
            }
            
            if let object = object as? CryptoCells{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CryptoCellsCollectionViewCell.reuseIdentifier, for: indexPath) as? CryptoCellsCollectionViewCell else {fatalError("Wasn't succesful")}
                cell.cryptoIcon.image = object.cryptoIcon
                cell.availableCrypto.text = object.availableCrypto
                return cell
            }
            
            
            if let object = object as? AddWalletCell{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddWalletCellCollectionViewCell.reuseIdentifier, for: indexPath) as? AddWalletCellCollectionViewCell else {fatalError("Wasn't succesful")}
                return cell
            }
            
            if let object = object as? PriceHistory{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriceHistoryCollectionViewCell.reuseIdentifier, for: indexPath) as? PriceHistoryCollectionViewCell else {fatalError("Wasn't succesful")}
                return cell
            }
            
            if let object = object as? PassiveIncomeView{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PassiveIncomeViewCollectionViewCell.reuseIdentifier, for: indexPath) as? PassiveIncomeViewCollectionViewCell else {fatalError("Wasn't succesful")}
                return cell
            }
            
            
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
            cell.backgroundColor = .yellow
            return cell
        })
        
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(OverviewTabViewData.Section.allCases)
        sections.forEach { section in
            snapshot.appendItems(OverviewTabViewData.allData[section]!, toSection: section)
        }
        diffDataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
}
