//
//  AddressesCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 20/10/2021.
//

import UIKit

class AddressesCollectionViewCell: UICollectionViewCell {
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var totalRecieved: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var cryptoAddress: UILabel!
    @IBOutlet weak var rmAddressBtn: UIButton!
    
    
    var delegate: AddressesCollectionViewController!
    
    static let reuseIdentifier = String(describing: AddressesCollectionViewCell.self)
    
    var removeCryptoAdressBtnCallback : ((_ cell: AddressesCollectionViewCell) -> Void)?
    
    var presentQRCodeViewCallback : ((_ cell: AddressesCollectionViewCell) -> Void)?
    
    var cryptoAddressData: CryptoAddressData! {
        didSet{
            totalRecieved.text = cryptoAddressData.totalRecieved
            createdAt.text = cryptoAddressData.createdAt
            cryptoAddress.text = cryptoAddressData.cryptoAddress
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    @IBAction func removeCryptoAdressBtn(_ sender: UIButton) {
        removeCryptoAdressBtnCallback?(self)
        self.delegate.alertViewToRemoveAddressCell()
    }
    
    @IBAction func presentQrCodeView(_ sender: UIButton) {
        presentQRCodeViewCallback?(self)
    }
    
    @IBAction func copyCrytoAddressBtn(_ sender: UIButton) {
        UIPasteboard.general.string = cryptoAddress.text
    }
    
}
