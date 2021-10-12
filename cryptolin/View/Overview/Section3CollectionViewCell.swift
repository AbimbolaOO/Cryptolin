//
//  Section3CollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 01/10/2021.
//

import UIKit

class Section3CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: Section3CollectionViewCell.self)

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
    }

}
