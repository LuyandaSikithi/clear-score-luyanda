import Foundation

struct Constants {
    static let baseUrl = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
    
    static let failedRequest = "Sorry there is a problem with the service. Please check your connection."
    static let noResponse = "Sorry can not score response"
    
    static let tableViewCell = "DetailsTableViewCell"
    
    enum detailsTitles {
        static let creditUsed = "Percentage Credit Used"
        static let shortTermDebt = "Current Short Term Debt"
        static let shortTermCreditLimit = "Current Short Term Credit Limit"
        static let changeInShortTermDebt = "Change In Short Term Debt"
        static let longTermDebt = "Current Long Term Debt"
    }
}
