//
//  NavbarTilteView.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import UIKit

class NavbarTilteView : UIView {
    lazy var profilePics: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "bitcoinsign.circle"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var registerLoginLabel: UIButton = {
        let btn = UIButton()
        btn.setAttributedTitle(NSAttributedString(string: "Cryptolin", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        return btn
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profilePics, registerLoginLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(stackView)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            profilePics.widthAnchor.constraint(equalToConstant: 32),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        stackView.spacing = 8
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}

