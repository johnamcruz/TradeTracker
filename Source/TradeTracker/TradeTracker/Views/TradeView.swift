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
            VStack(spacing: 0) {
                HStack {
                    Text(viewModel.contract?.ticker ?? "")
                    Text("\(viewModel.contract?.strikePrice ?? 0)")
                    Text(viewModel.contract?.optionType.rawValue ?? "")
                }
            }
            Spacer()
            Text("\(viewModel.profitOrLoss)")
                .font(.caption)
        }
    }
}

#Preview {
    TradeView(viewModel: TradeViewModel(name: "QQQ 10/9/2024 Call $493.00", profitOrLoss: 100))
}
