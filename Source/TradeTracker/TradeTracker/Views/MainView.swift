//
//  MainView.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//

import SwiftUI

struct MainView: View {
    @State var trades: [TradeViewModel] = []
    
    let service: TradeHistoryServiceable
    
    init(service: TradeHistoryServiceable) {
        self.service = service
    }
    
    var body: some View {
        TabView {
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                DashboardView(trades: trades)
            }
            .badge(2)


            Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                TradesView(trades: trades)
            }


            Tab("Account", systemImage: "person.crop.circle.fill") {
                AccountView()
            }
            .badge("!")
        }
        .task {
            do {
                trades = try await service.getTradeHistory().map{ $0.toTradeViewModel() }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    MainView(service: TradeHistoryService(service: MockTransactionHistoryService()))
}
