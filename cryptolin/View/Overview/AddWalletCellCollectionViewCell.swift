//
//  AddWalletCellCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 26/10/2021.
//

import UIKit

class AddWalletCellCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: AddWalletCellCollectionViewCell.self)
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        plusButton.layer.cornerRadius = plusButton.layer.frame.height / 2
    }

}
