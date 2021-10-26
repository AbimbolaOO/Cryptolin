//
//  Section2CollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 01/10/2021.
//

import UIKit

class TopStacticViewGroupCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: TopStacticViewGroupCollectionViewCell.self)

    @IBOutlet weak var containerForImageView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerForImageView.layer.cornerRadius = containerForImageView.layer.frame.height/2
        containerForImageView.backgroundColor = UIColor(white: 0.92, alpha: 1)
    }

}
