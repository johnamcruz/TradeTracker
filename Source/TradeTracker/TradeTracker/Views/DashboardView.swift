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
            Chart {
                
            }
        }
    }
}

#Preview {
    DashboardView(trades: TradeViewModel.mock())
}
