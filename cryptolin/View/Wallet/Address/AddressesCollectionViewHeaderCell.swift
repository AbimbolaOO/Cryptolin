//
//  AddressesCollectionViewHeaderCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 20/10/2021.
//

import UIKit

class AddressesCollectionViewHeaderCell: UICollectionReusableView {
    
    static let reuseIdentifier = String(describing: AddressesCollectionViewHeaderCell.self)
    
    let btn: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.title = "Generate new Bitcoin Address"
        filled.buttonSize = .large
        filled.image = UIImage(systemName: "plus")
        filled.imagePlacement = .leading
        filled.cornerStyle = .small
        
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 16)
        
        filled.attributedTitle = AttributedString("Generate new Bitcoin Address", attributes: container)
        filled.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 12)
        filled.imagePadding = 12

        let b = UIButton(configuration: filled, primaryAction: nil)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(createNewAddress), for: .touchUpInside)
        return b
    }()
    
    @objc func createNewAddress(){
        print("We would succeed!")
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(btn)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            btn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            btn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            btn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
