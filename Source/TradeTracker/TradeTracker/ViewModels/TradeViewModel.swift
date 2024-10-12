//
//  TradeViewModel.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/11/24.
//
import SwiftUI

struct TradeViewModel: Identifiable {
    var id: String
    var totalBought: Double
    var totalSold: Double
    var ticker: String
    var expirationDate: Date
    var optionType: OptionType
    var strikePrice: Double
    
    init(name: String, totalBought: Double, totalSold: Double) {
        self.id = name
        self.totalBought = totalBought
        self.totalSold = totalSold
        let contract = OptionContract.parseOptionContract(from: name)
        self.ticker = contract?.ticker ?? ""
        self.expirationDate = contract?.expirationDate ?? Date()
        self.optionType = contract?.optionType ?? .call
        self.strikePrice = contract?.strikePrice ?? 0
    }
    
    var profitOrLoss: Double {
        totalSold - totalBought
    }
}
