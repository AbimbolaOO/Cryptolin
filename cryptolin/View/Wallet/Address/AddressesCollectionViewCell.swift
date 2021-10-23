//
//  AddressesCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 20/10/2021.
//

import UIKit

class AddressesCollectionViewCell: UICollectionViewCell {
    
    var delegate: AddressesCollectionViewController!
    static let reuseIdentifier = String(describing: AddressesCollectionViewCell.self)
    
    var callback : ((_ cell: AddressesCollectionViewCell) -> Void)?
    
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
    @IBOutlet weak var deleteCellBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func removeCryptoAdressBtn(_ sender: UIButton) {
        callback?(self)
        self.delegate.alertViewToRemoveAddressCell()
    }
    
}
