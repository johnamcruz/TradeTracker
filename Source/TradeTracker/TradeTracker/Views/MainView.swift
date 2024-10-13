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
            Tab("Dashboard", systemImage: Images.dashboardImage) {
                DashboardView(viewModel: DashboardViewModel(trades: trades))
            }
            .badge(2)


            Tab("Trades", systemImage: Images.tradeHistoryImage) {
                TradesView(trades: trades)
            }


            Tab("Account", systemImage: Images.acountImage) {
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
