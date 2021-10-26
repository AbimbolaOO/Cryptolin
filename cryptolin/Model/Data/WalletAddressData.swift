//
//  WalletAddressData.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 25/10/2021.
//

import Foundation
import UIKit

struct WalletAddressInfo{
    let cryptoName: String
    let balance: String
    let totalRecieved: String
    let cryptoImage: UIImage
}

class WalletAddressData{
    static let listOfWalletAddressInfo = [
        WalletAddressInfo(cryptoName: "Bitcoin Wallet", balance: "0 BTC", totalRecieved: "0 BTC", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.yellow, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "Ethereum Wallet", balance: "0 ETH", totalRecieved: "0 ETH", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.systemTeal, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "Tether Wallet", balance: "0 USDT", totalRecieved: "0 USDT", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.green, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "Litecoin Wallet", balance: "0 LTC", totalRecieved: "0 LTC", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.blue, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "Ripple Wallet", balance: "0 XPR", totalRecieved: "0 XPR", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "Dash Wallet", balance: "0 DASH", totalRecieved: "0 DASH", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.systemBlue, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "EOS Wallet", balance: "0 EOS", totalRecieved: "0 EOS", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "Tron Wallet", balance: "0 TRX", totalRecieved: "0 TRX", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.red, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "BNB Wallet", balance: "0 BNB", totalRecieved: "0 BNB", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "HIVE Wallet", balance: "0 HIVE", totalRecieved: "0 HIVE", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.red, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "STEEM Wallet", balance: "0 STEEM", totalRecieved: "0 STEEM", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.blue, renderingMode: .alwaysOriginal)),
        WalletAddressInfo(cryptoName: "DOGE Wallet", balance: "0 DOGE", totalRecieved: "0 DOGE", cryptoImage: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.yellow, renderingMode: .alwaysOriginal))
    ]
}
