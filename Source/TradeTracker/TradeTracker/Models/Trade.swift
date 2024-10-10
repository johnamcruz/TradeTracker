//
//  Trade.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//
import Foundation

struct Trade: Codable {
    var instrument: String
    var description: String
    var transactions: [Transaction]
    var totalQuantity: Int
    var totalAmount: Double
    var totalBought: Double
    var totalSold: Double
    var totalBoughtQty: Int
    var totalSoldQty: Int
    
    var profitOrLoss: Double {
        totalSold - totalBought
    }
}
