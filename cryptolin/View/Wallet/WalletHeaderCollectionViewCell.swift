//
//  WalletHeaderCollectionViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 30/09/2021.
//

import UIKit

class WalletHeaderCollectionViewCell: UICollectionReusableView {
    
    static let reuseIdentifier = String(describing: WalletHeaderCollectionViewCell.self)
    
    let walletAdess: UILabel = {
        let label = UILabel()
        label.text = "  Wallet Address"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let describe: UILabel = {
        let label = UILabel()
        label.text = "  Wallet allows you to organize your fund into\n  categories, like spending and savings"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    let hzLine: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.lightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return v
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        let stackview = UIStackView(arrangedSubviews: [walletAdess, hzLine, describe])
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        
        addSubview(stackview)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.topAnchor.constraint(equalTo: topAnchor , constant: 24).isActive = true
        stackview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        stackview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        stackview.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
}
