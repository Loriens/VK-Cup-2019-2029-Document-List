//
//  DocumentItemResponse.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

struct DocumentItemResponse: Codable {
    
    // MARK: - Props
    var id: Int?
    var ownerId: Int?
    var title: String?
    var ext: String?
    var url: String?
    var date: Int?
    var type: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case ownerId = "owner_id"
        case title = "title"
        case ext = "ext"
        case url = "url"
        case date = "date"
        case type = "type"
    }
    
    // MARK: - Public functions
    func defaultMapping() -> DocumentItem? {
        guard let id = id,
            let ownerId = ownerId,
            let type = type,
            let documentType = DocumentItemType(rawValue: type) else { return nil }
        
        let date = Date(timeIntervalSince1970: Double(self.date ?? 0))
        return DocumentItem(id: id,
                            ownerId: ownerId,
                            title: title ?? "",
                            ext: ext ?? "",
                            url: url ?? "",
                            date: date,
                            type: documentType)
    }
    
}
