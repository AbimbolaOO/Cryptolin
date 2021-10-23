//
//  WalletViewCellTapedViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 16/10/2021.
//

import UIKit

class WalletViewCellTapedViewController: UIViewController {
    
    enum SegmetedCtrlTitles: Int{
        case addresses
        case transactions
    }
    
    @IBOutlet weak var segCtrl: CustomSegmentedControl!
    static let storyboardId = String(describing: WalletViewCellTapedViewController.self)
    
    lazy var EmptyTranscationsView: EmptyViewController = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: EmptyViewController.storyboardId) as! EmptyViewController
        return vc
    }()
    
    lazy var AddressView: UIViewController = {
        let vc = AddressesCollectionViewController()
//        vc.view.backgroundColor = .red
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        navigationItem.title = "BTC Addresses"
        
        addViewControllerAsChildVC(childVC: EmptyTranscationsView)
        addViewControllerAsChildVC(childVC: AddressView)
        
        setUpView(vc: AddressView)
    }
    
    private func addViewControllerAsChildVC(childVC: UIViewController){
        addChild(childVC)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        setUpView(vc: childVC)
    }
    
    func setUpView(vc: UIViewController){
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: segCtrl.bottomAnchor),
            vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @IBAction func customSegmentCrtlValChanged(_ sender: CustomSegmentedControl) {
        switch SegmetedCtrlTitles(rawValue: sender.selectedSegmentIndex){
        case .addresses:
            print("System 0")
            EmptyTranscationsView.view.isHidden = true
            AddressView.view.isHidden = false
        case .transactions:
            print("System 1")
            EmptyTranscationsView.view.isHidden = false
            AddressView.view.isHidden = true
        case .none:
            print("This shouldn't be")
        }
    }
}
