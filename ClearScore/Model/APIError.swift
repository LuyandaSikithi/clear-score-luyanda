//
//  NetworkError.swift
//  ClearScore
//
//  Created by Luyanda Sikithi on 2022/08/07.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case scoreNotFound
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .requestFailed:
            return  Constants.failedRequest
        case .scoreNotFound:
            return Constants.noResponse
        }
    }
}
