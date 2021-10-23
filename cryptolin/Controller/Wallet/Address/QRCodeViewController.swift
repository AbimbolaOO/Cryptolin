//
//  QRCodeViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 23/10/2021.
//

import UIKit
//import Foundation

class QRCodeViewController: UIViewController {
    
    static let storyboardId = String(describing: QRCodeViewController.self)
    
    @IBOutlet weak var qrCodeSuperContainerView: UIView!
    @IBOutlet weak var copyBtn: UIButton!
    @IBOutlet weak var warningView: UIView!
    @IBOutlet weak var qrcodeImageView: UIImageView!
    @IBOutlet weak var cryptoAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        navigationItem.title = "Recieve ETH"
        
        setUpView()
        qrcodeImageView.image = generateQRCode(stringToEncode: cryptoAddress.text!)
    }
    
    func setUpView(){
        qrCodeSuperContainerView.layer.cornerRadius = 8
        qrCodeSuperContainerView.layer.borderColor = UIColor.init(white: 0.90, alpha: 1).cgColor
        qrCodeSuperContainerView.layer.borderWidth = 1
        
        copyBtn.layer.cornerRadius = 4
        warningView.layer.cornerRadius = 4
    }
    
    func generateQRCode(stringToEncode: String) -> UIImage?{
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil}
        let qrData = stringToEncode.data(using: String.Encoding.ascii)
        qrFilter.setValue(qrData, forKey: "inputMessage")

        let qrTransform = CGAffineTransform(scaleX: 12, y: 12)
        guard let qrImage = qrFilter.outputImage?.transformed(by: qrTransform) else { return nil}
        return UIImage(ciImage: qrImage)
    }
    
    @IBAction func copyCrytoAddressBtn(_ sender: UIButton) {
        UIPasteboard.general.string = cryptoAddress.text
    }

}
