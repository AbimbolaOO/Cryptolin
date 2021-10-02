//
//  BackgroundForSectionsInOverview.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 01/10/2021.
//

import UIKit

class BackgroundForSectionsInOverview: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
