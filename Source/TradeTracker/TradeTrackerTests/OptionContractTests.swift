//
//  OptionContractTests.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/12/24.
//

import Foundation
import Testing
@testable import TradeTracker

struct OptionContractTests {
    @Test
    func parseOptionContractSuccessful() throws {
        let input = "QQQ 10/9/2024 Call $493.00"
        let optionContract = OptionContract.parseOptionContract(from: input)
        #expect(optionContract?.ticker == "QQQ")
        #expect(optionContract?.expirationDate.formatted(date: .numeric, time: .omitted) == "10/9/2024")
        #expect(optionContract?.optionType == .call)
        #expect(optionContract?.strikePrice == 493.00)
    }
    
    @Test
    func parseOptionContractFailure() throws {
        let input = "QQQ 10/9/2024 XXX $493.00"
        let optionContract = OptionContract.parseOptionContract(from: input)
        #expect(optionContract == nil)
    }
}
