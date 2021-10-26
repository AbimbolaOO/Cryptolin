//
//  OverviewTabViewData.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 26/10/2021.
//

import Foundation
import UIKit

struct YourBalance: Hashable{
    let balance: String
}

struct TopStacticViewGroup: Hashable{
    let image: UIImage
    let label: String
}

struct CryptoPortfolioSummary: Hashable{
    let portfolioValue: String
    let portfolioLoss: String
}

struct CryptoCells: Hashable{
    let availableCrypto: String
    let availableBalance: String
    let cryptoIcon: UIImage
    let percentUpOrDown: String
}

struct AddWalletCell: Hashable{
    let id = UUID()
}

struct PriceHistory: Hashable{
    let id = UUID()
}

struct PassiveIncomeView: Hashable{
    let id = UUID()
}

class OverviewTabViewData{
    
    enum Section: CaseIterable {
        case yourBalance
        case topStacticViewGroup
        case cryptoPortfolioSummary
        case cryptoCells
        case addWalletCell
        case priceHistory
        case passiveIncomeView
    }
    
}

extension OverviewTabViewData{
    static let allData: [Section: [AnyHashable]] = [
       Section.yourBalance: [YourBalance(balance: "NGN 0")],
       Section.topStacticViewGroup: [
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "Deposit"),
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "Buy/Sell"),
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "Withdraw"),
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "Transfer"),
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "Coin Swap"),
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "Price Alert"),
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "Airtime"),
            TopStacticViewGroup(image: UIImage(systemName: "paperplane.circle")!, label: "More")
        ],
       Section.cryptoPortfolioSummary: [CryptoPortfolioSummary(portfolioValue: "NGN 0", portfolioLoss: "NGN 0")],
       Section.cryptoCells: [
            CryptoCells(availableCrypto: "BTC 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.yellow, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "ETH 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.systemTeal, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "USDT 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.green, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "LTC 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.blue, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "XPR 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "DASH 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.systemBlue, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "EOS 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "TRX 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.red, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "BNB 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "HIVE 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.red, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "STEEM 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.blue, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%"),
            CryptoCells(availableCrypto: "DOGE 0", availableBalance: "NGN 0", cryptoIcon: UIImage(systemName: "bitcoinsign.circle.fill")!.withTintColor(UIColor.yellow, renderingMode: .alwaysOriginal), percentUpOrDown: "3.02%")
        ],
       Section.addWalletCell: [AddWalletCell()],
       Section.priceHistory: [PriceHistory()],
       Section.passiveIncomeView: [PassiveIncomeView()]
       
    ]
}
