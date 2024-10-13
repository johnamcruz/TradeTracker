//
//  Trade.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//
import Foundation

struct Trade: Codable {
    var name: String
    var activityDate: Date
    var transactions: [Transaction]
    
    init(name: String, activityDate: Date, transactions: [Transaction]) {
        self.name = name
        self.activityDate = activityDate
        self.transactions = transactions
    }
    
    var instrument: String {
        transactions.first?.instrument ?? ""
    }
    
    var totalQuantity: Int {
        if let transaction = transactions.first(where: { $0.transCode == .buyToOpen }) {
            return Int(transaction.quantity) ?? 0
        }
        return 0
    }
    
    var totalAmount: Double {
        transactions.reduce(0) { $0 + (Double($1.amount.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "$", with: "").replacingOccurrences(of: " ", with: "")) ?? 0.0) }
    }
        
    var totalBought: Double {
        transactions
            .filter { $0.transCode == .buyToOpen }
            .reduce(0) { $0 + (Double($1.amount.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "$", with: "").replacingOccurrences(of: " ", with: "")) ?? 0.0) }
    }
        
    var totalSold: Double {
        transactions
            .filter { $0.transCode == .sellToClose }
            .reduce(0) { $0 + (Double($1.amount.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "$", with: "").replacingOccurrences(of: " ", with: "")) ?? 0.0) }
    }
        
    var totalBoughtQty: Int {
        transactions
            .filter { $0.transCode == .buyToOpen }
            .reduce(0) { $0 + (Int($1.quantity) ?? 0) }
    }
        
    var totalSoldQty: Int {
        transactions
            .filter { $0.transCode == .sellToClose }
            .reduce(0) { $0 + (Int($1.quantity) ?? 0) }
    }
}

extension Trade {
    func toTradeViewModel() -> TradeViewModel {
        TradeViewModel(name: self.name,
                       activityDate: self.activityDate,
                       totalBought: self.totalBought,
                       totalSold: self.totalSold)
    }
}
