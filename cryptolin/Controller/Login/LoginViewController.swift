//
//  LoginViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 08/10/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    static let storyboardId = String(describing: LoginViewController.self)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 4
        containerView.layer.cornerRadius = 8
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func loginToAccoutBtn(_ sender: Any) {
        navigationController?.pushViewController(BaseTabBarController(), animated: true)
    }
    
    @IBAction func goToSignUpPageBtn(_ sender: Any) {
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: SignUpViewController.storyboardId) as! SignUpViewController
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
