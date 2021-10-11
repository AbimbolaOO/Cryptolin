//
//  SetUpPINViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 08/10/2021.
//

import UIKit

class SetUpPINViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func createPinBtn(_ sender: Any) {
        navigationController?.pushViewController(BaseTabBarController(), animated: true)
    }

}