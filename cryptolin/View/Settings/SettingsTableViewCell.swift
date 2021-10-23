//
//  SettingsTableViewCell.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let reUseIdentifier = String(describing: SettingsTableViewCell.self)
    
    var data: cellData! {
        didSet{
            iconImage.image = data.iconImage
            settingsTitle.text = data.settingsTitle
            settingShortDescription.text = data.settingShortDescription
        }
    }

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var settingsTitle: UILabel!
    @IBOutlet weak var settingShortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        accessoryType = .disclosureIndicator
        clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectionStyle = .none
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
