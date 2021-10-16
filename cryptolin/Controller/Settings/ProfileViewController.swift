//
//  ProfileViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 29/09/2021.
//

import UIKit
import PhotosUI
import CoreData
import Firebase
import Kingfisher

class ProfileViewController: UIViewController, PHPickerViewControllerDelegate{
    
    var db: Firestore!
    var storage: Storage!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let requestData = UserData.fetchRequest() as NSFetchRequest<UserData>
    
    static let storyboardId = String(describing: ProfileViewController.self)

    @IBOutlet weak var saveChangesBtn: UIButton!
    @IBOutlet weak var changeImageBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = Storage.storage()
        db = Firestore.firestore()
        navigationItem.title = "Profile"
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        
        saveChangesBtn.layer.cornerRadius = 4
        saveChangesBtn.addTarget(self, action: #selector(saveAllChanges), for: .touchUpInside)
        profileImage.layer.cornerRadius = profileImage.layer.frame.height/2
        setUpProfileData()
        
    }
    
    @objc func saveAllChanges(){
        uploadingImageToDB()
    }
    
    private func uploadingImageToDB(){
        //TODO: - make the profile image unique for each user
        let storageRef = storage.reference().child("image/profile")
        guard let image = profileImage.image else {fatalError("couldn't get the image")}
        guard let uploadData = image.jpegData(compressionQuality: 0.3) else {fatalError("couldn't compress image")}
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(uploadData, metadata: metaData) { metaData, error in
            guard let _ = metaData else{
                fatalError("Couldn't upload the image succesfully")
            }
            storageRef.downloadURL { url, error in
                guard let imageUrl = url else{
                    fatalError("Coundn't retrive data url")
                }
                print(imageUrl)
                self.addUrlToCoreData(imageUrl: imageUrl)
                self.updateUsersDBWithImageUrl(imageUrl: imageUrl)
            }
        }
    }
    
    private func addUrlToCoreData(imageUrl: URL){
        do{
            let userData = try context.fetch(requestData)
            userData[0].imageUrl = imageUrl
            try context.save()
        }catch{
            print("Unable to save image url to coreData")
        }
    }
    
    private func updateUsersDBWithImageUrl(imageUrl: URL){
        do {
            let userData = try context.fetch(requestData)
            if let email = userData[0].email {
                db.collection("users").document(email).updateData([
                    "imageUrl": imageUrl.absoluteString,
                ]){ err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
            }
        }catch{
            print("Eroor retriving email from core data")
        }
        
    }
    
    private func setUpProfileData(){
        do {
            let userData = try context.fetch(requestData)
            DispatchQueue.main.async {
                self.firstName.text = userData[0].firstName
                self.lastName.text = userData[0].lastName
                self.email.text = userData[0].email
                self.phoneNumber.text = userData[0].phoneNumber
                
                if let imageUrl = userData[0].imageUrl {
                    self.profileImage.kf.setImage(with: imageUrl)
                }
            }
        }catch{
            print("Unable to fetch user data from core data: \(error)")
        }
        
    }
    
    
    @IBAction func triggerChangePImg(_ sender: Any) {
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
