//
//  LoginSection2CollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 07/10/2021.
//

import UIKit

class OnBoardingSection2CollectionViewCell: UICollectionViewCell {
    
    weak var delegate: OnBoardingViewController?
    var currentPage = 0
    static let reuseIdentifier = String(describing: OnBoardingSection2CollectionViewCell.self)

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        getStartedBtn.layer.cornerRadius = getStartedBtn.layer.frame.height/2
        getStartedBtn.addTarget(self, action: #selector(setupText), for: .touchUpInside)
        
        pageControl.preferredIndicatorImage = UIImage(systemName: "minus")
        pageControl.setIndicatorImage(UIImage(systemName: "minus.square"), forPage: currentPage)
        pageControl.pageIndicatorTintColor = UIColor(white: 0.7, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(white: 1, alpha: 1)
    }
    
    @objc func setupText(){
        delegate?.popSignUpScreen(currentPage: currentPage)
        currentPage = currentPage + 1
        if currentPage < OnBoardingCollectionViewCellData.list.count{
            pageControl.currentPage = currentPage
            pageControl.setIndicatorImage(UIImage(systemName: "minus"), forPage: currentPage - 1)
            pageControl.setIndicatorImage(UIImage(systemName: "minus.square"), forPage: currentPage)
            pageControl.currentPageIndicatorTintColor = UIColor(white: 1, alpha: 1)
        }
        if currentPage > OnBoardingCollectionViewCellData.list.count - 2{
            getStartedBtn.setTitle("Next Page", for: .normal)
        }
    }
    
}
