import Foundation
import Combine
import Resolver

final class ScoreRepository: ScoreProtocol {

    func getScore(completionhandler: @escaping ((Result<ScoreResponse, Error>) -> Void)) {
        guard let url = URL(string: Constants.baseUrl) else { print("invalid url"); return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completionhandler(.failure(error))
                }
                
                guard let data = data else {  return  }
                let decoder = JSONDecoder()
                let decodedData = try? decoder.decode(ScoreResponse.self, from: data)
                guard let results = decodedData else {  return }
                completionhandler(.success(results))
            }
        }
        task.resume()
    }
}
