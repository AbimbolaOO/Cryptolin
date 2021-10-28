//
//  SavingsAddFundsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/10/2021.
//

import UIKit

class SavingsAddFundsViewController: UIViewController {
    
    var trackRadioBtnToggle: Bool = false
    static let storyboardId = String(describing: SavingsAddFundsViewController.self)
    
    let attributedOriginalText = NSMutableAttributedString(string: "I have read and understand the terms and conditions. Read terms again")
   lazy var linkRange = attributedOriginalText.mutableString.range(of: "Read terms again")
   lazy var fullRange = NSMakeRange(0, attributedOriginalText.length)

    @IBOutlet weak var topCardView: UIView!
    @IBOutlet weak var midCardView: UIView!
    @IBOutlet weak var bottonCardView: UIView!
    @IBOutlet weak var bottomBtn: UIButton!
    @IBOutlet weak var radioBtn: UIButton!
    @IBOutlet weak var termsTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Funds to Savings"
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.openWebPage(gesture:)))
        termsTextLabel.addGestureRecognizer(tapGR)
        
        setUpfaqTextLabel()
        setUpView()
    }
    
    @objc func openWebPage(gesture: UITapGestureRecognizer){
        if gesture.didTapAttributedTextInLabel(label: termsTextLabel, inRange: linkRange) {
            if let url = URL(string: "https://www.youtube.com") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func setUpView(){
        topCardView.layer.cornerRadius = 8
        midCardView.layer.cornerRadius = 8
        midCardView.clipsToBounds = true
        bottonCardView.layer.cornerRadius = 8
        bottonCardView.layer.borderWidth = 1
        bottonCardView.layer.borderColor = UIColor.white.cgColor
        bottomBtn.layer.cornerRadius = 6
        
        setUpRadioBtn()
    }
    
    func setUpfaqTextLabel(){
        
        let style = NSMutableParagraphStyle()
        style.alignment = .left
    
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: "https://google.com", range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
        
        self.termsTextLabel.attributedText = attributedOriginalText
    }
    
    @IBAction func radioBtnClickAction(_ sender: Any) {
        trackRadioBtnToggle = !trackRadioBtnToggle
        if trackRadioBtnToggle{
            setUpRadioBtn(borderColor: UIColor.systemBlue, imageColor: UIColor.systemBlue)
        }else{
            setUpRadioBtn()
        }
    }
    
    func setUpRadioBtn(borderColor: UIColor = UIColor.darkGray, imageColor: UIColor = UIColor.clear){
        radioBtn.layer.cornerRadius = radioBtn.layer.shadowOffset.height / 2
        radioBtn.layer.borderWidth = 2
        radioBtn.layer.borderColor = borderColor.cgColor
        radioBtn.setImage(UIImage(systemName: "circle.fill")!.withTintColor(imageColor, renderingMode: .alwaysOriginal), for: .normal)
        radioBtn.layer.cornerRadius = radioBtn.layer.frame.height / 2
    }
}
