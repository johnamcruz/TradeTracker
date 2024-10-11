//
//  Transaction.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//

import Foundation

struct Transaction: Codable {
    let activityDate: Date
    let processDate: Date
    let settleDate: Date
    let instrument: String
    let description: String
    let transCode: String
    let quantity: String
    let price: String
    let amount: String
    
    enum CodingKeys: String, CodingKey {
        case activityDate = "Activity Date"
        case processDate = "Process Date"
        case settleDate = "Settle Date"
        case instrument = "Instrument"
        case description = "Description"
        case transCode = "Trans Code"
        case quantity = "Quantity"
        case price = "Price"
        case amount = "Amount"
    }
}
