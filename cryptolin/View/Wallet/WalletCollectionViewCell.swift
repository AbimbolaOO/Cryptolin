//
//  WalletCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 30/09/2021.
//

import UIKit

class WalletCollectionViewCell: UICollectionViewCell {
    
    var setUpWalletAddressCellInfo: WalletAddressInfo!{
        didSet{
            cryptoImage.image = setUpWalletAddressCellInfo.cryptoImage
            cryptoName.text = setUpWalletAddressCellInfo.cryptoName
            cryptoBalance.text = setUpWalletAddressCellInfo.balance
            totalCryptoRecieved.text = setUpWalletAddressCellInfo.totalRecieved
        }
    }
    
    static let reuseIdentifier = String(describing: WalletCollectionViewCell.self)
    
    @IBOutlet weak var cryptoImage: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoBalance: UILabel!
    @IBOutlet weak var totalCryptoRecieved: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
    }
    
}
