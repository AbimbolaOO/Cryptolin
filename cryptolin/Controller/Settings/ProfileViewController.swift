//
//  ProfileViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit
import PhotosUI
import SwiftUI

class ProfileViewController: UIViewController, PHPickerViewControllerDelegate{
    
    static let storyboardId = String(describing: ProfileViewController.self)

    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var changeImageBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        buttonView.layer.cornerRadius = 4
        profileImage.layer.cornerRadius = profileImage.layer.frame.height/2
        
    }
    
    
    @IBAction func triggerChangePImg(_ sender: Any) {
        print("Clicked on")
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            let previousImage = profileImage.image
            itemProvider.loadObject(ofClass: UIImage.self){[weak self] image, error in
                DispatchQueue.main.async {
                    guard let self = self, let image = image as? UIImage, self.profileImage.image == previousImage else {
                        print("couldn't select this image")
                        return
                    }
                    self.profileImage.image = image
                }
            }
        }
    }
    
}
