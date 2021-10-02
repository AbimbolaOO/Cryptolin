//
//  TransactionsViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    static let storyboardId = String(describing: TransactionsViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = NavbarTilteView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
    }
}
