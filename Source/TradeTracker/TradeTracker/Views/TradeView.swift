//
//  TradeView.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/12/24.
//

import SwiftUI

struct TradeView: View {
    var viewModel: TradeViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(viewModel.ticker)
                    Text("\(viewModel.strikePrice, specifier: "%.0f")")
                    Text(viewModel.optionType.rawValue)
                }
                Text(viewModel.activityDate.formatted(date: .abbreviated, time: .omitted))
            }
            Spacer()
            Text("\(viewModel.profitOrLoss, specifier: "%.2f")")
                .font(.caption)
        }
        .padding()
    }
}

#Preview {
    TradeView(viewModel: TradeViewModel(name: "QQQ 10/9/2024 Call $493.00", activityDate: Date(), totalBought: 100, totalSold: 50))
}
