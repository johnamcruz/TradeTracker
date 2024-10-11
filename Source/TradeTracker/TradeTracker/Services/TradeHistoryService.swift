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
        []
    }
}
