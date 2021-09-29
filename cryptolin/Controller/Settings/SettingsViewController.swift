//
//  SettingsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 28/09/2021.
//

import UIKit

class SettingsViewController: UITabBarController, UITableViewDataSource, UITableViewDelegate {
    
    let tableViewCellId = SettingsTableViewCell.reUseIdentifier
    let tableView = UITableView()
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.alwaysBounceVertical = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: tableViewCellId, bundle: nil), forCellReuseIdentifier: tableViewCellId)
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        setupTableView()
        
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
        return 80
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
    
    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
    
}
