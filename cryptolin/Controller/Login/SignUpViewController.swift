//
//  SignUpViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 06/10/2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    enum formfield: Int {
        case firstName
        case lastName
        case email
        case phoneNumber
        case password
        case confirmPassord
    }
    
    var db: Firestore!
    
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
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        aiv.translatesAutoresizingMaskIntoConstraints = false
        return aiv
    }()
    
    lazy var textFieldArr: [UITextField] = [firstName, lastName, email, phoneNumber, password, confirmPassord]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
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
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView.isHidden = true
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        smallContentView.layer.cornerRadius = 8
        
        signUpBtn.addTarget(self, action: #selector(authenticateForm), for: .touchUpInside)
    }
    
    @objc func authenticateForm(){
        activityIndicatorView.isHidden = false
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { [self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                fatalError("coudn't create user on firebase")
            }
            print("\(user.email!) created")
            if user.email == self.email.text{
                setupNewUser(email: email.text!)
                let vc = storyBoard.instantiateViewController(withIdentifier: SetUpPINViewController.storyboardId) as! SetUpPINViewController
                activityIndicatorView.isHidden = true
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    private func setupNewUser(email: String){
        db.collection("users").document(email).setData([
            "firstName": firstName.text!,
            "last": lastName.text!,
            "email": email,
            "phoneNumber": phoneNumber.text!
        ]){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
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
                    signUpBtn.isEnabled = false
                }else{
                    validateFirstNameLabel.text = " "
                    isFormFieldValid()
                }
            case .lastName:
                let trimmedText = sender.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                if trimmedText.count < 2{
                    validateLastNameLabel.text = "invalid"
                    isFormFieldValid()
                }else{
                    validateLastNameLabel.text = " "
                    isFormFieldValid()
                }
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
            case .phoneNumber:
                let num = Int(sender.text!) ?? 0
                if sender.text!.count != 11{
                    validatePhoneNumberLabel.text = "Invalid phone number"
                    isFormFieldValid()
                }else if num == 0{
                    validatePhoneNumberLabel.text = "Invalid phone number"
                    isFormFieldValid()
                }else{
                    validatePhoneNumberLabel.text = " "
                    isFormFieldValid()
                }
            case .password:
                if sender.text!.count < 8{
                    validatePasswordLabel.text = "Password too short"
                    validateConfirmPasswordLabel.text = "Password doesn't match"
                    isFormFieldValid()
                }else{
                    if sender.text == confirmPassord.text{
                        validatePasswordLabel.text = " "
                        validateConfirmPasswordLabel.text = " "
                        isFormFieldValid()
                    }else{
                        validatePasswordLabel.text = " "
                        validateConfirmPasswordLabel.text = "Password doesn't match"
                        isFormFieldValid()
                    }
                    
                }
            case .confirmPassord:
                if sender.text != password.text{
                    validateConfirmPasswordLabel.text = "Password doesn't match"
                    isFormFieldValid()
                }else{
                    validateConfirmPasswordLabel.text = " "
                    isFormFieldValid()
                }
            }
        }
        
    }
    
    func isFormFieldValid(){
        if validateFirstNameLabel.text == " " && validateLastNameLabel.text == " " && validateEmailLabel.text == " " && validatePhoneNumberLabel.text == " " && validatePasswordLabel.text == " " && validateConfirmPasswordLabel.text == " " &&
            firstName.text! != "" &&
            lastName.text! != "" &&
            email.text! != "" &&
            phoneNumber.text! != "" &&
            password.text! != "" &&
            confirmPassord.text! != ""{
            self.signUpBtn.isEnabled = true
        }else{
            self.signUpBtn.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag < textFieldArr.count - 1{
            textField.resignFirstResponder()
            textFieldArr[textField.tag + 1].becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool{
        let maxLength = 11
        if textField.tag == 3{
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with:string) as NSString
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            return newString.length <= maxLength && string.rangeOfCharacter(from: invalidCharacters) == nil
        }
        return true
    }
    
}
