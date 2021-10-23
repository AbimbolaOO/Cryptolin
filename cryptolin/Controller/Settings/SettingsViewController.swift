//
//  SettingsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import UIKit
import SideMenu

class SettingsViewController: UITabBarController, UITableViewDataSource, UITableViewDelegate {
    
    var menu: SideMenuNavigationController!
    
    let tableViewCellId = SettingsTableViewCell.reUseIdentifier
//    let tableView = UITableView()
    lazy var tableView = UITableView(frame: view.bounds, style: .insetGrouped)
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.setupMenuViewController(MenuViewController.self, withIndentifier: MenuViewController.reuseIdentifier, menu: &menu, viewForGesture: view)
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(showMenu))
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: tableViewCellId, bundle: nil), forCellReuseIdentifier: tableViewCellId)
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorInset = .zero
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .systemGroupedBackground
      }
    
    @objc func showMenu(){
        present(menu, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingTableViewCellData.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as? SettingsTableViewCell else {fatalError("Couldn't create the cells")}
        cell.data = SettingTableViewCellData.list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            revealSetting(withIdentifier: ProfileViewController.storyboardId, ProfileViewController.self)
        case 1:
            revealSetting(withIdentifier: AccountsViewController.storyboardId, AccountsViewController.self)
        case 2:
            revealSetting(withIdentifier: PreferencesViewController.storyboardId, PreferencesViewController.self)
        case 3:
            revealSetting(withIdentifier: SecurityViewController.storyboardId, SecurityViewController.self)
        case 4:
            revealSetting(withIdentifier: NINViewController.storyboardId, NINViewController.self)
        case 5:
            revealSetting(withIdentifier: ReferralsViewController.storyboardId, ReferralsViewController.self)
        case 6:
            revealSetting(withIdentifier: PaymentLinkViewController.storyboardId, PaymentLinkViewController.self)
        default:
            revealSetting(withIdentifier: ReferralsViewController.storyboardId, ReferralsViewController.self)
        }
    }
    
    func revealSetting<T>(withIdentifier: String, _ t: T.Type){
        if let board = storyBoard.instantiateViewController(withIdentifier: withIdentifier) as? T{
            navigationController?.pushViewController(board as! UIViewController, animated: true)
        }
    }
}
