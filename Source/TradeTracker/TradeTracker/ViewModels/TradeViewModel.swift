//
//  TradeViewModel.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/11/24.
//
import SwiftUI

struct TradeViewModel: Identifiable {
    var id: String
    var name: String
    var profitOrLoss: Double
    var contract: OptionContract?
    
    init(name: String, profitOrLoss: Double) {
        self.id = UUID().uuidString
        self.name = name
        self.profitOrLoss = profitOrLoss
        self.contract = OptionContract.parseOptionContract(from: name)
    }
}
