//
//  CryptoPortfolioSummaryCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 26/10/2021.
//

import UIKit

class CryptoPortfolioSummaryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CryptoPortfolioSummaryCollectionViewCell.self)
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var portfolioValue: UILabel!
    @IBOutlet weak var portfolioLoss: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.layer.borderColor = UIColor.blue.cgColor
        containerView.layer.borderWidth = 1
    }

}
