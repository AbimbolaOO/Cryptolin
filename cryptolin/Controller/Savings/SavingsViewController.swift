//
//  SavingsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit
import SideMenu

class SavingsViewController: UIViewController {
    
    var menu: SideMenuNavigationController!
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    static let storyboardId = String(describing: SavingsViewController.self)

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var saveTextView: UIView!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.setupMenuViewController(MenuViewController.self, withIndentifier: MenuViewController.reuseIdentifier, menu: &menu, viewForGesture: view)
        
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 4
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        
        saveTextView.layer.cornerRadius = saveTextView.layer.frame.height/2
        
        getStartedBtn.layer.cornerRadius = 4
        getStartedBtn.addTarget(self, action: #selector(presentSavingViewController), for: .touchUpInside)
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(showMenu))
    }
    
    @objc func showMenu(){
        present(menu, animated: true, completion: nil)
    }
    
    @objc func presentSavingViewController(){
        guard let vc = storyBoard.instantiateViewController(withIdentifier: SelectSavingsOptionsViewController.storyboardId) as? SelectSavingsOptionsViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
