//
//  MenuViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 04/10/2021.
//

import UIKit
import CoreData
import Kingfisher

class MenuViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let requestData = UserData.fetchRequest() as NSFetchRequest<UserData>
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var userName: UILabel!
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
        userPicture.layer.cornerRadius = userPicture.layer.frame.height / 2
        userPicture.clipsToBounds = true
        
        setUpProfileImage()
        setUpUserName()
        
    }
    
    private func setUpUserName(){
        do{
            let userData = try context.fetch(requestData)
            if let firstName = userData[0].firstName, let lastName = userData[0].lastName{
                self.userName.text = "\(lastName) \(firstName)"
            }
        }catch{
            print("Unable to laod image from coreData")
        }
    }
    
    private func setUpProfileImage(){
        do{
            let userData = try context.fetch(requestData)
            if let imageUrl = userData[0].imageUrl {
                self.userPicture.kf.setImage(with: imageUrl)
            }
        }catch{
            print("Unable to laod image from coreData")
        }
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
        deleteCoreData()
        UserDefaults.standard.set(false, forKey: "LoggedIn")
        UserDefaults.standard.synchronize()
    }
    
    private func deleteCoreData(){
        print("deleting core data")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "UserData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
            try context.save()
            
        }catch{
            print("Unable to delete user data from core data: \(error)")
        }
    }
    
}
