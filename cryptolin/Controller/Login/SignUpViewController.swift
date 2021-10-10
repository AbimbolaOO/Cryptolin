//
//  SignUpViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 06/10/2021.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    enum formfield: Int {
        case firstName
        case lastName
        case email
        case phoneNumber
        case password
        case confirmPassord
    }
    
    static let storyboardId = String(describing: SignUpViewController.self)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var smallContentView: UIView!
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassord: UITextField!
    
    @IBOutlet weak var validateFirstNameLabel: UILabel!
    @IBOutlet weak var validateLastNameLabel: UILabel!
    @IBOutlet weak var validateEmailLabel: UILabel!
    @IBOutlet weak var validatePhoneNumberLabel: UILabel!
    @IBOutlet weak var validatePasswordLabel: UILabel!
    @IBOutlet weak var validateConfirmPasswordLabel: UILabel!
    
    lazy var textFieldArr: [UITextField] = [firstName, lastName, email, phoneNumber, password, confirmPassord]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpBtn.isEnabled = false
        
        firstName.delegate = self
        lastName.delegate = self
        email.delegate = self
        phoneNumber.delegate = self
        password.delegate = self
        confirmPassord.delegate = self
        
        firstName.becomeFirstResponder()
        
        firstName.tag = 0
        lastName.tag = 1
        email.tag = 2
        phoneNumber.tag = 3
        password.tag = 4
        confirmPassord.tag = 5
        
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
    
    
    @IBAction func checkTextFieldValidity(_ sender: UITextField) {
        
        if let field = formfield(rawValue: sender.tag){
            switch field {
            case .firstName:
                let trimmedText = sender.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                if trimmedText.count < 2{
                    validateFirstNameLabel.text = "invalid"
                }else{
                    validateFirstNameLabel.text = " "
                }
            case .lastName:
                let trimmedText = sender.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                if trimmedText.count < 2{
                    validateLastNameLabel.text = "invalid"
                }else{
                    validateLastNameLabel.text = " "
                }
            case .email:
                if sender.text!.count < 8{
                    validateEmailLabel.text = "Invalid email"
                }else{
                    validateEmailLabel.text = " "
                }
            case .phoneNumber:
                let num = Int(sender.text!) ?? 0
                if sender.text!.count < 12{
                    validatePhoneNumberLabel.text = "Invalid phone number"
                }else if num == 0{
                    validatePhoneNumberLabel.text = "Invalid phone number"}
                else{
                    validatePhoneNumberLabel.text = " "
                }
            case .password:
                if sender.text!.count < 8{
                    validatePasswordLabel.text = "Password too short"
                }else{
                    validatePasswordLabel.text = " "
                }
            case .confirmPassord:
                if sender.text != password.text{
                    validateConfirmPasswordLabel.text = "Password doesn't match"
                }else{
                    validateConfirmPasswordLabel.text = " "
                }
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag < textFieldArr.count - 1{
            textField.resignFirstResponder()
            textFieldArr[textField.tag + 1].becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
            self.signUpBtn.isEnabled = true
        }
        
        return true
    }
    
}
