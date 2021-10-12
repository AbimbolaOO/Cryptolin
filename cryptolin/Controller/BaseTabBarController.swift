//
//  BaseTabBarController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let transactionsController = storyBoard.instantiateViewController(withIdentifier: TransactionsViewController.storyboardId) as! TransactionsViewController
        
        let savingsViewController = storyBoard.instantiateViewController(withIdentifier: SavingsViewController.storyboardId) as! SavingsViewController
        
        viewControllers = [
            createView(viewController: OverviewViewController(), label: "Overview", imageName: "rectangle.grid.2x2"),
            createView(viewController: WalletViewController(), label: "Wallets", imageName: "wallet.pass.fill"),
            createView(viewController: savingsViewController, label: "Savings", imageName: "dollarsign.circle"),
            createView(viewController: transactionsController, label: "Transactions", imageName: "filemenu.and.selection"),
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
        appearance.shadowColor = .clear
        
        vc.navigationBar.standardAppearance = appearance;
        vc.navigationBar.scrollEdgeAppearance = vc.navigationBar.standardAppearance
        vc.navigationBar.tintColor = UIColor.white
        
        vc.tabBarItem.image = UIImage(systemName:imageName)
        vc.tabBarItem.title = label
        return vc
    }
    
}
