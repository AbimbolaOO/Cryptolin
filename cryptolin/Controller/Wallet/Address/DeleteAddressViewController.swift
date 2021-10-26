//
//  DeleteAddressViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 22/10/2021.
//

import UIKit

protocol DeleteCryptoAddressProtocol: AnyObject{
    func removeCryptoAddress()
}

class DeleteAddressViewController: UIViewController {
    
    static let storyboardId = String(describing: DeleteAddressViewController.self)
    
    weak var delegate: DeleteCryptoAddressProtocol!
    
    @IBOutlet weak var alertView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundViewBottom()
    }
    
    func roundViewBottom(){
        let path = UIBezierPath(roundedRect:alertView.bounds, byRoundingCorners:[.bottomRight, .bottomLeft], cornerRadii: CGSize(width: 6, height:  6))
        
        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        alertView.layer.mask = maskLayer
    }

    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okBtn(_ sender: Any) {
        self.delegate.removeCryptoAddress()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == alertView.superview{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
