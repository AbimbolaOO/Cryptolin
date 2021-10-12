//
//  LoginSection2CollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 07/10/2021.
//

import UIKit

class OnBoardingSection2CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: OnBoardingSection2CollectionViewCell.self)

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        getStartedBtn.layer.cornerRadius = getStartedBtn.layer.frame.height/2
        
        pageControl.preferredIndicatorImage = UIImage(systemName: "minus")
        let startPage = 0
        pageControl.setIndicatorImage(UIImage(systemName: "minus.square"), forPage: startPage)
        pageControl.pageIndicatorTintColor = UIColor(white: 0.7, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(white: 1, alpha: 1)
    }
    
}
