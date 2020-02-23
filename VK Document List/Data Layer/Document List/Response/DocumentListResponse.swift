//
//  DocumentListResponse.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

struct DocumentListResponse: Codable {
    var response: Response?
    
    struct Response: Codable {
        var items: [DocumentItemResponse]?
    }
    
    func getDocumentItems() -> [DocumentItem] {
        return response?.items?.compactMap({ $0.defaultMapping() }) ?? []
    }
}
