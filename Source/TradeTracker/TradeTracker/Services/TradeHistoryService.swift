//
//  TradeHistoryService.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/11/24.
//

protocol TradeHistoryServiceable {
    func getTradeHistory() async throws -> [Trade]
}

struct TradeHistoryService: TradeHistoryServiceable {
    let service: TransactionHistoryServiceable
    
    init(service: TransactionHistoryServiceable) {
        self.service = service
    }
    
    func getTradeHistory() async throws -> [Trade] {
        if let transactions = try? await service.getTransactionHistory() {
            var dictionary = [String: [Transaction]]()
            for transaction in transactions.filter({ $0.transCode == .buyToOpen || $0.transCode == .sellToClose }) {
                dictionary[transaction.description, default: []].append(transaction)
            }
            return dictionary.map { Trade(name: $0.key, transactions: $0.value) }
        }
        return []
    }
}
