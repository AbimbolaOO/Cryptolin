//
//  SavingsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit

class SavingsViewController: UIViewController {
    
    static let storyboardId = String(describing: SavingsViewController.self)

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var saveTextView: UIView!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 4
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        
        saveTextView.layer.cornerRadius = saveTextView.layer.frame.height/2
        
        getStartedBtn.layer.cornerRadius = 4
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
    }
}
