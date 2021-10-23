//
//  BackgroundSupplementaryView.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 30/09/2021.
//

import UIKit

class BackgroundSupplementaryView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.masksToBounds = true
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

