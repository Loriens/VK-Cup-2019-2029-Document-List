//
//  DocumentListError.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

enum DocumentListError: Error, LocalizedError {
    
    case allLoaded
    case isLoading
    case noInternetConnection
    case unknown(error: Error?)
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "InternetConnectionError".localized
        case let .unknown(error):
            return error?.localizedDescription ?? "Error".localized
        default:
            return "Error".localized
        }
    }
    
}
