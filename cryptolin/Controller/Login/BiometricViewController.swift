//
//  BiometricViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 14/10/2021.
//

import UIKit
import LocalAuthentication

class BiometricViewController: UIViewController {
    
    static let storyboardId = String(describing: BiometricViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = LAContext()
        context.localizedCancelTitle = "Enter Username/Password"
        
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            
        }
        
        let reason = "Log in to your account"
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
            
            if success {
                DispatchQueue.main.async { [unowned self] in
                    guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                        fatalError("could not get scene delegate ")
                    }
                    sceneDelegate.window?.rootViewController = BaseTabBarController()
                    navigationController?.popToRootViewController(animated: true)
                }
                
            } else {
                print(error?.localizedDescription ?? "Failed to authenticate")
            }
        }
    }
}
