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
    let quantity: Double
    let price: Double
    let amount: Double
}
