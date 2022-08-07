import Foundation

struct ScoreResponse: Decodable {
    var accountIDVStatus: String?
    var creditReportInfo: CreditReport?
    var dashboardStatus: String?
    var personaType: String?
    var coachingSummary: Coaching?
    var augmentedCreditScore: String?
}

struct CreditReport: Decodable {
    var score: Int
    var scoreBand: Int?
    var clientRef: String?
    var status: String?
    var maxScoreValue: Int?
    var minScoreValue: Int?
    var monthsSinceLastDefaulted: Int?
    var hasEverDefaulted: Bool?
    var monthsSinceLastDelinquent: Int?
    var hasEverBeenDelinquent: Bool?
    var percentageCreditUsed: Int?
    var percentageCreditUsedDirectionFlag: Int?
    var changedScore: Int?
    var currentShortTermDebt: Int?
    var currentShortTermNonPromotionalDebt: Int?
    var currentShortTermCreditLimit: Int?
    var currentShortTermCreditUtilisation: Int?
    var changeInShortTermDebt: Int?
    var currentLongTermDebt: Int?
    var currentLongTermNonPromotionalDebt: Int?
    var currentLongTermCreditLimit: String?
    var currentLongTermCreditUtilisation: String?
    var changeInLongTermDebt: Int?
    var numPositiveScoreFactors: Int?
    var numNegativeScoreFactors: Int?
    var equifaxScoreBand: Int?
    var equifaxScoreBandDescription: String?
    var daysUntilNextReport: Int?
}

struct Coaching: Decodable {
    var activeTodo: Bool?
    var activeChat: Bool?
    var numberOfTodoItems: Int?
    var numberOfCompletedTodoItems: Int?
    var selected: Bool?
}
