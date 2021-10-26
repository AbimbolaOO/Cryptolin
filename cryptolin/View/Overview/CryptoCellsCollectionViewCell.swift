//
//  Section3CollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 01/10/2021.
//

import UIKit

class CryptoCellsCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CryptoCellsCollectionViewCell.self)

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cryptoIcon: UIImageView!
    @IBOutlet weak var availableCrypto: UILabel!
    @IBOutlet weak var availableBalance: UILabel!
    @IBOutlet weak var percentUpOrDown: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
    }

}
