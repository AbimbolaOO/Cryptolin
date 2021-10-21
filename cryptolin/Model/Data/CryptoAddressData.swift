//
//  CryptoAddress.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 21/10/2021.
//

import Foundation


class CryptoAddressData: Hashable{
    static func == (lhs: CryptoAddressData, rhs: CryptoAddressData) -> Bool {
        lhs.cryptoAddress == rhs.cryptoAddress
    }
    
    func hash(into hasher: inout Hasher) {
      // 2
      hasher.combine(cryptoAddress)
    }
    
    
    var totalRecieved: String
    var createdAt: String
    var cryptoAddress: String
    
    init(totalRecieved: String, createAt: String, cryptoAddress: String){
        self.totalRecieved = totalRecieved
        self.createdAt = createAt
        self.cryptoAddress = cryptoAddress
    }
    
}

extension CryptoAddressData{
    static let allCryptoAddressInfo = [
        CryptoAddressData(totalRecieved: "10", createAt: "19", cryptoAddress: "dfe89819ef6f2ea2bfe257d154ad6808"),
        CryptoAddressData(totalRecieved: "112", createAt: "48", cryptoAddress: "997bb5806687df08e891621b333c89f8"),
        CryptoAddressData(totalRecieved: "48", createAt: "119", cryptoAddress: "9efeb677282bd7a6ed8628784c5a63d4"),
        CryptoAddressData(totalRecieved: "10", createAt: "19", cryptoAddress: "1fda92d78a838494d96a7c011a809db4"),
        CryptoAddressData(totalRecieved: "112", createAt: "48", cryptoAddress: "7745d13406a5d2a770d74ef44097909b"),
        CryptoAddressData(totalRecieved: "48", createAt: "119", cryptoAddress: "e9402b33e80c0c5123354cc7ca3b7f63"),
        CryptoAddressData(totalRecieved: "10", createAt: "19", cryptoAddress: "ddb0e899456dcd628045b0be08e4f3df"),
        CryptoAddressData(totalRecieved: "112", createAt: "48", cryptoAddress: "f8a6da934782e6f952c54580d03afefa"),
        CryptoAddressData(totalRecieved: "48", createAt: "119", cryptoAddress: "aee16e504aaca0777353079876ee82df")
    ]
}
