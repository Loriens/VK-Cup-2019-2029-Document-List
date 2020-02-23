//
//  DocumentItemResponse.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

struct DocumentItemResponse: Codable {
    var id: Int?
    var title: String?
    var ext: String?
    var url: String?
    var date: Int?
    var type: Int?
    
    func defaultMapping() -> DocumentItem? {
        guard let id = id,
            let type = type else { return nil }
        
        let date = Date(timeIntervalSince1970: Double(self.date ?? 0))
        return DocumentItem(id: id,
                            title: title ?? "",
                            ext: ext ?? "",
                            url: url ?? "",
                            date: date,
                            type: type)
    }
}
