//
//  SecurityViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit

class SecurityViewController: UIViewController {
    
    static let storyboardId = String(describing: SecurityViewController.self)
    
    @IBOutlet weak var overrallContainingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        overrallContainingView.layer.borderWidth = 1
        overrallContainingView.layer.cornerRadius = 4
        overrallContainingView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
