//
//  ReferralsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit

class ReferralsViewController: UIViewController {
    
    static let storyboardId = String(describing: ReferralsViewController.self)

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewSubView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Referrals"
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        topView.layer.borderWidth = 1
        topView.layer.cornerRadius = 4
        topView.layer.borderColor = UIColor.lightGray.cgColor
        
        topViewSubView.layer.borderWidth = 1
        topViewSubView.layer.cornerRadius = 4
        topViewSubView.layer.borderColor = UIColor.lightGray.cgColor
        
        bottomView.layer.borderWidth = 1
        bottomView.layer.cornerRadius = 4
        bottomView.layer.borderColor = UIColor.lightGray.cgColor

    }

}
