//
//  DepositViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/10/2021.
//

import UIKit

class DepositViewController: UIViewController, UITextFieldDelegate {
    
    let dollarRate:Float = 560.0
    static let storyboardId = String(describing: DepositViewController.self)
    
    @IBOutlet weak var NGNTextField: CustomTextField!
    @IBOutlet weak var USDTextField: CustomTextField!
    @IBOutlet weak var switchSuperView: UIView!
    @IBOutlet weak var proceedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NGNTextField.textField.delegate = self
        USDTextField.textField.delegate = self
        
        setUpView()
    }
    
    func setUpView(){
        switchSuperView.layer.cornerRadius = 6
        switchSuperView.layer.borderColor = UIColor.lightGray.cgColor
        switchSuperView.layer.borderWidth = 1
        
        proceedBtn.layer.cornerRadius = 4
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == NGNTextField.textField{
            if let str = NGNTextField.textField.text as NSString?{
                let dollarEquivalence = str.floatValue / dollarRate
                print(dollarEquivalence)
                USDTextField.textField.text = String(dollarEquivalence)
//                USDTextField.changeTextFieldAppearance()
            }
        }
        if textField == USDTextField.textField{
            if let str = USDTextField.textField.text as NSString?{
                let nairaEquivalence = str.floatValue * dollarRate
                NGNTextField.textField.text = String(nairaEquivalence)
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
            let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
            return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
}
