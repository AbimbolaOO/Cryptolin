//
//  Section1CollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 01/10/2021.
//

import UIKit

class Section1CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: Section1CollectionViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = UIColor.systemBlue.cgColor
    }

}
