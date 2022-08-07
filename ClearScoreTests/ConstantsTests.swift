//
//  ConstantsTests.swift
//  ClearScoreTests
//
//  Created by Luyanda Sikithi on 2022/08/07.
//

import XCTest
@testable import ClearScore

class ConstantsTests: XCTestCase {

    func testConstants() {
        XCTAssertEqual(Constants.tableViewCell, "DetailsTableViewCell")
        XCTAssertEqual(Constants.detailsTitles.creditUsed, "Percentage Credit Used")
        XCTAssertEqual(Constants.detailsTitles.shortTermDebt, "Current Short Term Debt")
        XCTAssertEqual(Constants.detailsTitles.shortTermCreditLimit, "Current Short Term Credit Limit")
        XCTAssertEqual(Constants.detailsTitles.changeInShortTermDebt, "Change In Short Term Debt")
        XCTAssertEqual(Constants.detailsTitles.longTermDebt, "Current Long Term Debt")
    }
}
