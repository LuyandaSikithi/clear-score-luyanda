//
//  LaunchScore.swift
//  ClearScore
//
//  Created by Luyanda Sikithi on 2022/08/02.
//

import Foundation
protocol LaunchScore: AnyObject {
    func displayScore(score: ScoreResponse)
    func showError(errorMessage: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
