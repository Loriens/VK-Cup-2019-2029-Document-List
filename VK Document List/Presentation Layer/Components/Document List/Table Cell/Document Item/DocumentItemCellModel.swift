//
//  DocumentItemCellModel.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

class DocumentItemCellModel: TableCellModel {
    
    // MARK: - Props
    public override var cellIdentifier: String {
        return DocumentItemTableCell.identifier
    }
    
    public override var cellHeight: CGFloat {
        return 84
    }
    
    let documentItem: DocumentItem
    
    // MARK: - Initalization
    init(_ documentItem: DocumentItem) {
        self.documentItem = documentItem
    }
    
}
