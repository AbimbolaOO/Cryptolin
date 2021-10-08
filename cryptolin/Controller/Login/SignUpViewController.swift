//
//  SignUpViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 06/10/2021.
//

import UIKit

class SignUpViewController: UIViewController {
    static let storyboardId = String(describing: SignUpViewController.self)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var smallContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        smallContentView.layer.cornerRadius = 8
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    
    @IBAction func goToLoginPageBtn(_ sender: Any) {
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: LoginViewController.storyboardId) as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    

}
