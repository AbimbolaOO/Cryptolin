//
//  WalletViewCellTapedViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 16/10/2021.
//

import UIKit

class WalletViewCellTapedViewController: UIViewController {
    
    let storyboardId = String(describing: WalletViewCellTapedViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
    @IBAction func customSegmentCrtlValChanged(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("System 0")
        case 1:
            print("System 1")
        case 2:
            print("System 2")
        default:
            print("We dey for default")
        }
    }
}
