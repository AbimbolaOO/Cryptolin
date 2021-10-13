//
//  OnBoardingViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 07/10/2021.
//

import UIKit

class OnBoardingViewController: UICollectionViewController{
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    var currentPage = 0
    
    let ImgArr = [1, 2, 4, 4]
    
    init(){
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection?  in
            switch sectionNumber{
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.75)), subitems: [item])
                //                group.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                
                return section
                
            default:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)), subitems: [item])
                group.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            }
            
        }
        
        layout.register(BackgroundForSectionsInOverview.self, forDecorationViewOfKind: "background")
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.alwaysBounceVertical = false
        collectionView.isScrollEnabled = false
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.register(UINib(nibName: OnBoardingSection1CollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: OnBoardingSection1CollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: OnBoardingSection2CollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: OnBoardingSection2CollectionViewCell.reuseIdentifier)
        collectionView.layer.backgroundColor = UIColor.systemBlue.cgColor
        collectionView.showsVerticalScrollIndicator = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 4
        default:
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingSection1CollectionViewCell.reuseIdentifier, for: indexPath) as? OnBoardingSection1CollectionViewCell else{
                fatalError("couldn't create cell")
            }
            cell.data = OnBoardingCollectionViewCellData.list[indexPath.row]
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingSection2CollectionViewCell.reuseIdentifier, for: indexPath) as? OnBoardingSection2CollectionViewCell else{
                fatalError("couldn't create cell")
            }
            cell.getStartedBtn.addTarget(self, action: #selector(popSignUpScreen), for: .touchUpInside)
            return cell
        }
        
    }
    
    
    @objc func popSignUpScreen(){
        
        if currentPage < ImgArr.count {
            let indexPath = IndexPath(item: currentPage + 1, section: 0)
            currentPage = currentPage + 1
            collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
        
        if currentPage == 4{
            let signUpViewController = storyBoard.instantiateViewController(withIdentifier: SignUpViewController.storyboardId) as! SignUpViewController
            
            navigationController?.pushViewController(signUpViewController, animated: true)
        }
        
    }
    
    
    
}


