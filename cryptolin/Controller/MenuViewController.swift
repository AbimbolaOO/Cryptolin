//
//  MenuViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 04/10/2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var labelViewBox: UIView!
    @IBOutlet weak var userPicture: UIImageView!
    
    static let reuseIdentifier = String(describing: MenuViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelViewBox.layer.cornerRadius = 4
        labelViewBox.layer.borderWidth = 1
        labelViewBox.layer.borderColor = UIColor.darkGray.cgColor
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.userPictureImageTapped))
        userPicture.addGestureRecognizer(tapGR)
        userPicture.isUserInteractionEnabled = true
        
    }
    
    @objc func userPictureImageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let sb = storyBoard.instantiateViewController(withIdentifier: ProfileViewController.storyboardId) as! ProfileViewController
            navigationController?.pushViewController(sb, animated: true)
        }
    }
    
    @IBAction func goToLoginPageBtn(_ sender: Any) {
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: LoginViewController.storyboardId) as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
        UserDefaults.standard.set(false, forKey: "LoggedIn")
        UserDefaults.standard.synchronize()
    }
    
}
