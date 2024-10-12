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
        List {
            ForEach(trades) { trade in
                HStack {
                    /*@START_MENU_TOKEN@*/Text(trade.name)/*@END_MENU_TOKEN@*/
                    Spacer()
                    Text("\(trade.profitOrLoss)")
                }
            }
        }
    }
}

#Preview {
    TradesView(trades: [])
}
