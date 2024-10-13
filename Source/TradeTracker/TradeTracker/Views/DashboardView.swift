//
//  Dashboard.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//

import SwiftUI
import Charts

struct DashboardView: View {
    let trades: [TradeViewModel]
    
    var body: some View {
        NavigationStack {
            // Profit and Loss (P&L) Over Time
            Chart {
                ForEach(trades) { trade in
                    LineMark(
                        x: .value("Date", trade.activityDate),
                        y: .value("P/L", trade.profitOrLoss)
                    )
                }
            }
        }
    }
}

#Preview {
    DashboardView(trades: TradeViewModel.mock())
}
