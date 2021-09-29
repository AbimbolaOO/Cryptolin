//
//  BaseTabBarController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createView(viewController: OverviewViewController(), label: "Overview", imageName: "rectangle.grid.2x2"),
            createView(viewController: WalletViewController(), label: "Wallets", imageName: "wallet.pass.fill"),
            createView(viewController: SavingsViewController(), label: "Savings", imageName: "dollarsign.circle"),
            createView(viewController: TransactionsViewController(), label: "Transactions", imageName: "filemenu.and.selection"),
            createView(viewController: SettingsViewController(), label: "Settings", imageName: "gearshape")
        ]
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.systemBlue
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.backgroundColor = UIColor(white: 1, alpha: 1)
    }
    
    func createView(viewController: UIViewController, label: String, imageName: String) -> UIViewController{
        let vc = UINavigationController(rootViewController: viewController)
 
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = attributes
        
        vc.navigationBar.standardAppearance = appearance;
        vc.navigationBar.scrollEdgeAppearance = vc.navigationBar.standardAppearance
        vc.navigationBar.tintColor = UIColor.white
        
        vc.tabBarItem.image = UIImage(systemName:imageName)
        vc.tabBarItem.title = label
        return vc
    }
    
}
