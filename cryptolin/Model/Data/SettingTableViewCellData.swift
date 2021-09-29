//
//  File.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import Foundation
import UIKit

struct cellData{
    let iconImage: UIImage!
    let settingsTitle: String
    let settingShortDescription: String
}

class SettingTableViewCellData {
    
    static var list: [cellData] = [
        cellData(iconImage: UIImage(systemName: "person.text.rectangle"), settingsTitle: "Profile", settingShortDescription: "Manage profile details"),
        cellData(iconImage: UIImage(systemName: "house"), settingsTitle: "Accounts", settingShortDescription: "Add and remove bank details"),
        cellData(iconImage: UIImage(systemName: "gearshape.2.fill"), settingsTitle: "Preferences", settingShortDescription: "Manage how your account works"),
        cellData(iconImage: UIImage(systemName: "shield.lefthalf.filled"), settingsTitle: "Security", settingShortDescription: "Further secure you account and funds"),
        cellData(iconImage: UIImage(systemName: "person.crop.circle.fill.badge.checkmark"), settingsTitle: "Verification", settingShortDescription: "Secure you identity to increase limits"),
        cellData(iconImage: UIImage(systemName: "link"), settingsTitle: "Referrals", settingShortDescription: "Refer you friend to earn money"),
        cellData(iconImage: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill"), settingsTitle: "Payment Links", settingShortDescription: "Recieve crypto payments with ease")
    ]
    
}
