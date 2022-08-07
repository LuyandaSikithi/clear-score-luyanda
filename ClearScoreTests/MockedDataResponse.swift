//
//  MockedDataResponse.swift
//  ClearScoreTests
//
//  Created by Luyanda Sikithi on 2022/08/07.
//

import Foundation
@testable import ClearScore

class MockedDataResponse: ScoreProtocol {
    
    static let response = ScoreResponse.init(accountIDVStatus: "PASS", creditReportInfo: CreditReport.init(score: 300, scoreBand: 4, clientRef: "CS-SED-655426-708782", status: "Match", maxScoreValue: 700, minScoreValue: 0, monthsSinceLastDefaulted: -1, hasEverDefaulted: false, monthsSinceLastDelinquent: 1, hasEverBeenDelinquent: true, percentageCreditUsed: 44, percentageCreditUsedDirectionFlag: 1, changedScore: 0, currentShortTermDebt: 13758, currentShortTermNonPromotionalDebt: 13758, currentShortTermCreditLimit: 30600, currentShortTermCreditUtilisation: 44, changeInShortTermDebt: 549, currentLongTermDebt: 24682, currentLongTermNonPromotionalDebt: 24682, currentLongTermCreditLimit: "", currentLongTermCreditUtilisation: "", changeInLongTermDebt: -327, numPositiveScoreFactors: 9, numNegativeScoreFactors: 0, equifaxScoreBand: 4, equifaxScoreBandDescription: "Excellent", daysUntilNextReport: 9), dashboardStatus: "PASS", personaType: "INEXPERIENCED", coachingSummary: Coaching.init(activeTodo: false, activeChat: true, numberOfTodoItems: 0, numberOfCompletedTodoItems: 0, selected: true), augmentedCreditScore: "")
    

    func getScore(completionhandler: @escaping ((Result<ScoreResponse, Error>) -> Void)) {
        
        if MockedDataResponse.response.creditReportInfo != nil {
            completionhandler(.success(MockedDataResponse.response))
        }else{
            completionhandler(.failure(APIError.requestFailed))
        }
    }
}
