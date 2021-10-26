//
//  YourBalanceCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 26/10/2021.
//

import UIKit

class YourBalanceCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: YourBalanceCollectionViewCell.self)

    @IBOutlet weak var balance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
