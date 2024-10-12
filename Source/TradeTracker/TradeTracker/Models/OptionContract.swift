//
//  OptionContract.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/12/24.
//

import Foundation

enum OptionType: String, Codable {
    case call = "Call"
    case put = "Put"
}

struct OptionContract: Codable {
    var ticker: String
    var expirationDate: Date
    var optionType: OptionType
    var strikePrice: Double
    
    init(ticker: String, expirationDate: Date, optionType: OptionType, strikePrice: Double) {
        self.ticker = ticker
        self.expirationDate = expirationDate
        self.optionType = optionType
        self.strikePrice = strikePrice
    }
    
    init?(input: String) {
        if let optionContract = OptionContract.parseOptionContract(from: input) {
            self.ticker = optionContract.ticker
            self.expirationDate = optionContract.expirationDate
            self.optionType = optionContract.optionType
            self.strikePrice = optionContract.strikePrice
        } else {
            return nil
        }
    }
}

extension OptionContract {
    static func parseOptionContract(from input: String) -> OptionContract? {
        let pattern = #"([A-Z]+) (\d{1,2}/\d{1,2}/\d{4}) (Call|Put) \$([\d.]+)"#
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy"  // Format for the expiration date
        
        if let match = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count)) {
            // Ticker Symbol
            if let tickerRange = Range(match.range(at: 1), in: input) {
                let ticker = String(input[tickerRange])
                
                // Expiration Date
                if let dateRange = Range(match.range(at: 2), in: input),
                   let expirationDate = dateFormatter.date(from: String(input[dateRange])) {
                    
                    // Option Type
                    if let optionTypeRange = Range(match.range(at: 3), in: input) {
                        let optionType = String(input[optionTypeRange])
                        
                        // Strike Price
                        if let strikePriceRange = Range(match.range(at: 4), in: input),
                           let strikePrice = Double(String(input[strikePriceRange])) {
                            
                            return OptionContract(ticker: ticker,
                                                  expirationDate: expirationDate,
                                                  optionType: OptionType(rawValue: optionType) ?? OptionType.call,
                                                  strikePrice: strikePrice)
                        }
                    }
                }
            }
        }
        
        return nil
    }

}
