//
//  OnBoardingCollectionViewCellData.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 08/10/2021.
//

import Foundation
import UIKit

struct OnboardingCellData{
    let iconImage: UIImage!
    let viewTitle: String
    let viewShortDescription: String
}

class OnBoardingCollectionViewCellData {
    
    static var list: [OnboardingCellData] = [
        OnboardingCellData(iconImage: UIImage(systemName: "message.circle"), viewTitle: "24 Hours Support", viewShortDescription: "Whenever you need help cryptolin support team is just one tap away all the time"),
        OnboardingCellData(iconImage: UIImage(systemName: "house"), viewTitle: "Accounts", viewShortDescription: "Add and remove bank details"),
        OnboardingCellData(iconImage: UIImage(systemName: "gearshape.2.fill"), viewTitle: "Preferences", viewShortDescription: "Manage how your account works"),
        OnboardingCellData(iconImage: UIImage(systemName: "shield.lefthalf.filled"), viewTitle: "Security", viewShortDescription: "Further secure you account and funds")
    ]
    
}
