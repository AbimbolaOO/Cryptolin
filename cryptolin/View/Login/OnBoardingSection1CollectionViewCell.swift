//
//  LoginSection1CollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 07/10/2021.
//

import UIKit

class OnBoardingSection1CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: OnBoardingSection1CollectionViewCell.self)
    
    var data: OnboardingCellData! {
        didSet{
            iconImage.image = data.iconImage
            viewTitle.text = data.viewTitle
            viewShortDescription.text = data.viewShortDescription
        }
    }
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var viewShortDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
