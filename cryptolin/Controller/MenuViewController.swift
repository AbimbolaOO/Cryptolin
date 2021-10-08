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
    static let reuseIdentifier = String(describing: MenuViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        labelViewBox.layer.cornerRadius = 4
        labelViewBox.layer.borderWidth = 1
        labelViewBox.layer.borderColor = UIColor.darkGray.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToLoginPageBtn(_ sender: Any) {
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: LoginViewController.storyboardId) as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }

}
