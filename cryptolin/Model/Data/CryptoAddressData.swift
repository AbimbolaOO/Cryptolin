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
        CryptoAddressData(totalRecieved: "10", createAt: "19", cryptoAddress: UUID().uuidString)
    ]
}
