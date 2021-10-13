//
//  LoginViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 08/10/2021.
//

import UIKit
import Firebase

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
        
        loginBtn.isEnabled = false
        
        email.delegate = self
        password.delegate = self
        
        email.becomeFirstResponder()
        
        email.tag = 0
        password.tag = 1
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        loginBtn.addTarget(self, action: #selector(loginToAccoutBtn), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @objc func loginToAccoutBtn(){
        print("btn click now just wait")
        let email = self.email.text!
        let password = self.password.text!
        Auth.auth().signIn(withEmail: email, password: password) { [self] authResult, error in
            print("I am in prepare")
            if error != nil{
                fatalError("Omo which kind login be this")
            }else {
                guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                    fatalError("could not get scene delegate ")
                }
                sceneDelegate.window?.rootViewController = BaseTabBarController()
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    
    @IBAction func goToSignUpPageBtn(_ sender: Any) {
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: SignUpViewController.storyboardId) as! SignUpViewController
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction func checkTextFieldValidity(_ sender: UITextField) {
        
        if let field = formfield(rawValue: sender.tag){
            switch field {
            case .email:
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                if !emailPred.evaluate(with: sender.text!) {
                    validateEmailLabel.text = "Invalid email"
                    isFormFieldValid()
                }else{
                    validateEmailLabel.text = " "
                    isFormFieldValid()
                }
            case .password:
                if sender.text!.count < 8{
                    validatePasswordLabel.text = "Password too short"
                    isFormFieldValid()
                }else{
                    validatePasswordLabel.text = " "
                    isFormFieldValid()
                }
            }
        }
    }
    
    func isFormFieldValid(){
        if validateEmailLabel.text == " " &&
            validatePasswordLabel.text == " " &&
            email.text! != "" &&
            password.text! != "" {
            self.loginBtn.isEnabled = true
        }else{
            self.loginBtn.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag < textFieldArr.count - 1{
            textField.resignFirstResponder()
            textFieldArr[textField.tag + 1].becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
            self.loginBtn.isEnabled = true
        }
        
        return true
    }
    
}
