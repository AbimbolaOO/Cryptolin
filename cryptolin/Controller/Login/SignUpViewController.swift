//
//  SignUpViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 06/10/2021.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var smallContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    
        smallContentView.layer.cornerRadius = 8
        
        
    }

}
