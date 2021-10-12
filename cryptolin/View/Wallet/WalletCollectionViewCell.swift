//
//  WalletCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 30/09/2021.
//

import UIKit

class WalletCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: WalletCollectionViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
    }

}
