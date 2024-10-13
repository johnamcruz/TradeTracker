//
//  Dashboard.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//

import SwiftUI
import Charts

struct DashboardView: View {
    let viewModel: DashboardViewModel
    
    var body: some View {
        NavigationStack {
            // Profit and Loss (P&L) Over Time
            Chart {
                ForEach(viewModel.trades) { trade in
                    LineMark(
                        x: .value("Date", trade.activityDate),
                        y: .value("P/L", trade.profitOrLoss)
                    )
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) {
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.day(.defaultDigits))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
        }
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel(trades:  TradeViewModel.mock()))
}
