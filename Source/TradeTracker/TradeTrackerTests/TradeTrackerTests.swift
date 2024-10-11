//
//  TradeHistoryServiceTests.swift
//  TradeHistoryServiceTests
//
//  Created by John M Cruz on 10/11/24.
//

import Testing
@testable import TradeTracker

struct TradeHistoryServiceTests {

    @Test func getTransactionHistory() async throws {
        let service = MockTransactionHistoryService()
        let transactions = try await service.getTransactionHistory()
        #expect(transactions.count > 0)
    }

    @Test func getTradeHistory() async throws {
        let service = MockTransactionHistoryService()
        let tradeService = TradeHistoryService(service: service)
        let trades = try await tradeService.getTradeHistory()
        #expect(trades.count > 0)
    }
}
