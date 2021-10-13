//
//  SetUpPINViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 08/10/2021.
//

import UIKit

class SetUpPINViewController: UIViewController {
    
    static let storyboardId = String(describing: SetUpPINViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func createPinBtn(_ sender: Any) {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("could not get scene delegate ")
        }
        sceneDelegate.window?.rootViewController = BaseTabBarController()
        navigationController?.popToRootViewController(animated: true)
    }

}
