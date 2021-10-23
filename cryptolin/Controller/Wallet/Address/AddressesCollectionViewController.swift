//
//  AdddressesCollectionViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 18/10/2021.
//

import UIKit
import CoreMedia

class AddressesCollectionViewController: UICollectionViewController, DeleteCryptoAddressProtocol{
    
    enum Section{
        case main
    }
    var indexTracker: Int!
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    private var allCryptoAddressInfoList = CryptoAddressData.allCryptoAddressInfo
    private lazy var dataSource = makeDataSource()
    typealias DataSource = UICollectionViewDiffableDataSource<Section, CryptoAddressData>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, CryptoAddressData>
    
    lazy var setIndextrackerCallback = { [self] (currentCell: UICollectionViewCell) in
        indexTracker = collectionView.indexPath(for: currentCell)![1]
        print("button pressed", indexTracker!)
    }
    
    lazy var presentQRCodeViewCallback = {[self] (currentCell: UICollectionViewCell) in
        if let vc = storyBoard.instantiateViewController(withIdentifier: QRCodeViewController.storyboardId) as? QRCodeViewController{
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    init(){
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        
        section.boundarySupplementaryItems = [headerItem]
        
        let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
        let backgroundInset: CGFloat = 9.5
        backgroundItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: backgroundInset, bottom: backgroundInset, trailing: backgroundInset)
        
        section.decorationItems = [backgroundItem]
        section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register(BackgroundForSectionsInOverview.self, forDecorationViewOfKind: "background")
        
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = true
        collectionView.showsVerticalScrollIndicator = false
        
        applySnapshot()
        
        self.collectionView!.register(UINib(nibName: AddressesCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: AddressesCollectionViewCell.reuseIdentifier)
        self.collectionView.register(AddressesCollectionViewHeaderCell.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: AddressesCollectionViewHeaderCell.reuseIdentifier)
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(allCryptoAddressInfoList)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, cryptoAddressData) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AddressesCollectionViewCell.reuseIdentifier,
                for: indexPath) as? AddressesCollectionViewCell
            cell?.cryptoAddressData = cryptoAddressData
            cell?.removeCryptoAdressBtnCallback = self.setIndextrackerCallback
            cell?.presentQRCodeViewCallback = self.presentQRCodeViewCallback
            cell?.delegate = self
            return cell
        })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == "header" else {
                return nil
            }
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: AddressesCollectionViewHeaderCell.reuseIdentifier,
                for: indexPath) as? AddressesCollectionViewHeaderCell
            view?.backgroundColor = .init(white: 0.99, alpha: 1)
            return view
        }
        return dataSource
    }
    
    func alertViewToRemoveAddressCell(){
        let vc = storyBoard.instantiateViewController(withIdentifier: DeleteAddressViewController.storyboardId) as! DeleteAddressViewController
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    func removeCryptoAddress(){
        print("Finally removing address")
        var snapshot = dataSource.snapshot()
        let identfiers = snapshot.itemIdentifiers(inSection: .main)
        snapshot.deleteItems([identfiers[indexTracker]])
        dataSource.apply(snapshot, animatingDifferences: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}
