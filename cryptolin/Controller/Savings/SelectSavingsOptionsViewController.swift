//
//  SelectSavingsOptionsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 24/10/2021.
//

import UIKit
import SwiftUI

class SelectSavingsOptionsViewController: UIViewController {
    @IBOutlet weak var largeContentContainerView: UIView!
    @IBOutlet weak var smallContentContainerView: UIView!
    @IBOutlet weak var faqTextLabel: UILabel!
    @IBOutlet weak var earningRatingBadgeLabel: UIView!
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var percentageViewTop: UILabel!
    @IBOutlet weak var percentageViewBottom: UILabel!
    
    static let storyboardId = String(describing: SelectSavingsOptionsViewController.self)
    
    let attributedOriginalText = NSMutableAttributedString(string: "Take a look at the frequently asked questions (FAQs) about our savings option Click here")
    lazy var linkRange = attributedOriginalText.mutableString.range(of: "Click here")
    lazy var fullRange = NSMakeRange(0, attributedOriginalText.length)
    
    let backgroundImage: UIImage = {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor(named: "myDarkYellow")?.cgColor ?? UIColor.yellow.cgColor)
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }()
    
    let separatorBackgroundImage: UIImage = {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.black.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Select Savings Option"
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        setUpUI()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(gesture:)))
        faqTextLabel.addGestureRecognizer(tapGR)
        
    }
    
    func setUpUI(){
        largeContentContainerView.layer.cornerRadius = 8
        largeContentContainerView.layer.borderWidth = 1
        largeContentContainerView.layer.borderColor = UIColor.lightGray.cgColor
        largeContentContainerView.clipsToBounds = true
        proceedBtn.layer.cornerRadius = 4
        smallContentContainerView.layer.cornerRadius = 4
        
        customizeSegmentedCtrl()
        roundViewBottom()
        setUpfaqTextLabel()
    }
    
    func customizeSegmentedCtrl(){
        segmentedCtrl.layer.borderColor = UIColor.black.cgColor
        segmentedCtrl.layer.cornerRadius = 2
        segmentedCtrl.layer.borderWidth = 1
        segmentedCtrl.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        segmentedCtrl.backgroundColor = .clear
        segmentedCtrl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedCtrl.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        segmentedCtrl.setDividerImage(separatorBackgroundImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 2
        
        segmentedCtrl.addTarget(self, action: #selector(segmentedControlValueChanged(sender:)), for: .valueChanged)
    }
    
    func roundViewBottom(){
        earningRatingBadgeLabel.layer.cornerRadius = 6
        earningRatingBadgeLabel.layer.maskedCorners = [.layerMinXMaxYCorner]
    }
    
    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            setPercentage("+0.8%")
        }
        if sender.selectedSegmentIndex == 1 {
            setPercentage("+3.0%")
        }
        if sender.selectedSegmentIndex == 2 {
            setPercentage("+7.0%")
        }
        if sender.selectedSegmentIndex == 3 {
            setPercentage("+15.0%")
        }
    }
    
    func setPercentage(_ percentage: String){
        percentageViewTop.text = percentage
        percentageViewBottom.text = percentage
    }
    
    func setUpfaqTextLabel(){
        let style = NSMutableParagraphStyle()
        style.alignment = .left
    
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: "", range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
        self.faqTextLabel.attributedText = attributedOriginalText
    }
    
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttributedTextInLabel(label: faqTextLabel, inRange: linkRange) {
            print("Tapped targetRange1")
        }else {
            print("Tapped none")
        }
    }
    
}


extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
    }

}
