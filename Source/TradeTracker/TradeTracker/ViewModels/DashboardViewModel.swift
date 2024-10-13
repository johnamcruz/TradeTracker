//
//  DashboardViewModel.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/12/24.
//

struct DashboardViewModel {
    let buyingPower: Double = 0
    let trades: [TradeViewModel]
    
    init(trades: [TradeViewModel]) {
        self.trades = trades
    }
}
