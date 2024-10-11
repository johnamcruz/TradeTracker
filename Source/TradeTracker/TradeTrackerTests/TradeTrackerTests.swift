//
//  TradeHistoryServiceTests.swift
//  TradeHistoryServiceTests
//
//  Created by John M Cruz on 10/11/24.
//

import Testing
@testable import TradeTracker

struct TradeHistoryServiceTests {

    @Test func getTradeHistory() async throws {
        let service = MockTradeHistoryService()
        _ = try await service.getTradeHistory()
    }

}
