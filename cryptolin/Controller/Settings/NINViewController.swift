//
//  ViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import UIKit

class NINViewController: UIViewController {
    
    static let storyboardId = String(describing: NINViewController.self)
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var ninTextView: UITextField!
    @IBOutlet weak var verificationBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Verify NIN"

        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        infoView.layer.cornerRadius = 4
        
        ninTextView.layer.borderColor = UIColor.darkGray.cgColor
        ninTextView.layer.borderWidth = 1
        ninTextView.layer.cornerRadius = 4
        ninTextView.attributedPlaceholder = NSAttributedString(string: "Enter NIN", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        verificationBtn.layer.cornerRadius = 4
    }
    
    

}
