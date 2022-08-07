import Foundation
import Resolver

class ScoreViewModel: ObservableObject {
    
    private weak var view: LaunchScore?
    
    @Injected private var response: ScoreProtocol
    
    init(_ view: LaunchScore) {
        self.view = view
    }
    func getScore(){
        self.view?.showLoadingIndicator()
        response.getScore { results in
            self.view?.hideLoadingIndicator()
            switch results {
            case .success(let data):
                self.view?.displayScore(score: data)
            case .failure(let error):
                self.view?.showError(errorMessage: error.localizedDescription)
            }
        }
    }
  
}
