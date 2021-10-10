//
//  LoginViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 08/10/2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    enum formfield: Int {
        case email
        case password
    }
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var validateEmailLabel: UILabel!
    @IBOutlet weak var validatePasswordLabel: UILabel!
    
    static let storyboardId = String(describing: LoginViewController.self)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    lazy var textFieldArr: [UITextField] = [email, password]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 4
        containerView.layer.cornerRadius = 8
        
        
//        loginBtn.setTitleColor(.white, for: .disabled)
        loginBtn.isEnabled = false
        
        email.delegate = self
        password.delegate = self
        
        email.becomeFirstResponder()
        
        email.tag = 0
        password.tag = 1
        
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
    
    @IBAction func checkTextFieldValidity(_ sender: UITextField) {
        
        if let field = formfield(rawValue: sender.tag){
            switch field {
            case .email:
                if sender.text!.count < 8{
                    validateEmailLabel.text = "Invalid email"
                }else{
                    validateEmailLabel.text = " "
                }
            case .password:
                if sender.text!.count < 8{
                    validatePasswordLabel.text = "Password too short"
                }else{
                    validatePasswordLabel.text = " "
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag < textFieldArr.count - 1{
            textField.resignFirstResponder()
            print("here is current tag: \(textField.tag)")
            textFieldArr[textField.tag + 1].becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
            self.loginBtn.isEnabled = true
        }
        
        return true
    }
    
}
