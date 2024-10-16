//
//  TradesView.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//

import SwiftUI

struct TradesView: View {
    let trades: [TradeViewModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(trades) { trade in
                    TradeView(viewModel: trade)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Trades")
        }
    }
}

#Preview {
    TradesView(trades: TradeViewModel.mock())
}
