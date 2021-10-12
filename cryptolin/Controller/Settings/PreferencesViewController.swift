//
//  PreferencesViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit

class PreferencesViewController: UIViewController {
    
    static let storyboardId = String(describing: PreferencesViewController.self)

    @IBOutlet weak var porfolioView: UIView!
    @IBOutlet weak var weeklyEmailView: UIView!
    @IBOutlet weak var overrallContainingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Preferences"
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        porfolioView.layer.borderWidth = 1
        porfolioView.layer.cornerRadius = 4
        porfolioView.layer.borderColor = UIColor.lightGray.cgColor
        
        weeklyEmailView.layer.borderWidth = 1
        weeklyEmailView.layer.cornerRadius = 4
        weeklyEmailView.layer.borderColor = UIColor.lightGray.cgColor
        
        overrallContainingView.layer.borderWidth = 1
        overrallContainingView.layer.cornerRadius = 4
        overrallContainingView.layer.borderColor = UIColor.lightGray.cgColor
        
    }

}
