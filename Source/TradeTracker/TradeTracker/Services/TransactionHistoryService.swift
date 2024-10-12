//
//  TransactionHistoryService.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/11/24.
//
import CodableCSV
import Foundation

protocol TransactionHistoryServiceable {
    func getTransactionHistory() async throws -> [Transaction]
}

struct MockTransactionHistoryService: TransactionHistoryServiceable  {
    func getTransactionHistory() async throws -> [Transaction] {
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let decoder = CSVDecoder {
                $0.encoding = .utf8
                $0.delimiters.field = ","
                $0.delimiters.row = "\n"
                $0.headerStrategy = .firstLine
                $0.bufferingStrategy = .keepAll
                $0.dateStrategy = .formatted(dateFormatter)
            }
            
            if let url = Bundle.main.url(forResource: "robinhood-data", withExtension: "csv") {
                return try decoder.decode([Transaction].self, from: url)
            }
            return []
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
