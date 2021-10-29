//
//  CustomBtnView.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/10/2021.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField{
    
    @IBInspectable
    var textFieldBackgroundColor: UIColor = UIColor.white {
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.darkGray {
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.systemBlue {
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var cornerRadius: Int = 8{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var borderWidth: Int = 1{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var activeBorderWidth: Int = 2{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var textFieldIndent: Int = 10{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var animatedPlhldrPos: Float = 22{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var animatedPlhldrText: String = "Nil"{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var placeholderText: String = "Enter X"{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    @IBInspectable
    var labelFontSize: Int = 17{
        didSet{
            SetUpCtmTxtField()
        }
    }
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = .none
        textField.leftViewMode = .always
        textField.layer.borderWidth = CGFloat(borderWidth)
        textField.textColor = borderColor
//        textField.font = UIFont.systemFont(ofSize: CGFloat(labelFontSize))
        textField.layer.cornerRadius = CGFloat(cornerRadius)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var animatedPlaceholderText: UILabel = {
        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 17)
        label.layer.backgroundColor = textFieldBackgroundColor.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func SetUpCtmTxtField(){
        self.addSubview(textField)
        self.addSubview(animatedPlaceholderText)
        
        self.backgroundColor = textFieldBackgroundColor
        
        self.textField.layer.borderColor = borderColor.cgColor
        let leftImageView = UIView(frame: CGRect(x: 0, y: 0, width: textFieldIndent, height:0))
        textField.leftView = leftImageView
        textField.font = UIFont.systemFont(ofSize: CGFloat(labelFontSize))
        
        self.animatedPlaceholderText.text = animatedPlhldrText
        self.animatedPlaceholderText.textColor = borderColor
        self.animatedPlaceholderText.font = UIFont.systemFont(ofSize: CGFloat(labelFontSize))
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            animatedPlaceholderText.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(animatedPlhldrPos)),
            animatedPlaceholderText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        textField.addTarget(self, action: #selector(changeTextFieldAppearance), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(resetTextFieldAppearance), for: .editingDidEnd)
    }
    
    @objc func changeTextFieldAppearance(){
        textField.layer.borderWidth = CGFloat(activeBorderWidth)
        textField.layer.borderColor = activeBorderColor.cgColor
        textField.placeholder = placeholderText
        textField.tintColor = activeBorderColor
        animatedPlaceholderText.textColor = activeBorderColor
        
        if textField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count < 1{
            UIView.animate(withDuration: 0.3) {
                self.animatedPlaceholderText.frame.origin.y = 0
                self.animatedPlaceholderText.frame.origin.x = CGFloat(self.textFieldIndent) * 0.7
                self.animatedPlaceholderText.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    @objc func resetTextFieldAppearance(){
        textField.layer.borderWidth = CGFloat(borderWidth)
        textField.layer.borderColor = borderColor.cgColor
        textField.placeholder = .none
        animatedPlaceholderText.textColor = borderColor
        
        if textField.text != nil && textField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count < 1{
            UIView.animate(withDuration: 0.3) {
                self.animatedPlaceholderText.frame.origin.y = CGFloat(self.animatedPlhldrPos)
                self.animatedPlaceholderText.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
}
