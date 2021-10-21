//
//  AddressesCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 20/10/2021.
//

import UIKit

class AddressesCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: AddressesCollectionViewCell.self)
    
    var cryptoAddressData: CryptoAddressData! {
        didSet{
            totalRecieved.text = cryptoAddressData.totalRecieved
            createdAt.text = cryptoAddressData.createdAt
            cryptoAddress.text = cryptoAddressData.cryptoAddress
        }
    }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var totalRecieved: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var cryptoAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.lightGray.cgColor
    }

}
