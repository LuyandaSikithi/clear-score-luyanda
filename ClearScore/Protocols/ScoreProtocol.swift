//
//  ScoreProtocol.swift
//  ClearScore
//
//  Created by Luyanda Sikithi on 2022/08/07.
//

import Foundation
protocol ScoreProtocol {
    func getScore(completionhandler: @escaping ((Result<ScoreResponse, Error>) -> Void))
}
