//
//  PaymentLinkViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit

class PaymentLinkViewController: UIViewController {
    
    static let storyboardId = String(describing: PaymentLinkViewController.self)

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonView: UIButton!
    
    @IBOutlet weak var overrallContainerVeiw: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Payment Link"
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        overrallContainerVeiw.layer.borderWidth = 1
        overrallContainerVeiw.layer.cornerRadius = 4
        overrallContainerVeiw.layer.borderColor = UIColor.lightGray.cgColor
       
        buttonView.layer.cornerRadius = 4
    }
    

}
