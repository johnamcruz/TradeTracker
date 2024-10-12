//
//  TradeTrackerApp.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//

import SwiftUI

@main
struct TradeTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(service: TradeHistoryService(service: MockTransactionHistoryService()))
        }
    }
}
