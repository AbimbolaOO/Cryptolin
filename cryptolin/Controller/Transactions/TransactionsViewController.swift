//
//  TransactionsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit
import SideMenu

class TransactionsViewController: UIViewController {
    
    var menu: SideMenuNavigationController!
    
    static let storyboardId = String(describing: TransactionsViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.setupMenuViewController(MenuViewController.self, withIndentifier: MenuViewController.reuseIdentifier, menu: &menu, viewForGesture: view)
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(showMenu))
    }
    
    @objc func showMenu(){
        present(menu, animated: true, completion: nil)
    }
}
