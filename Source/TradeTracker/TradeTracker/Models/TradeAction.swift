//
//  TradeAction.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/11/24.
//

enum TradeAction: String, Codable {
    case buyToOpen = "BTO"
    case sellToClose = "STC"
    case dividendCaptureFlag = "DCF"
    case interestPayment = "INT"
    case slippage = "SLIP"
    case sellOwnedStocks = "Sell"
    case accountTransfer = "ACATI"
    case optionExpiration = "OEXP"
    case automatedClearingHouse = "ACH"
}
