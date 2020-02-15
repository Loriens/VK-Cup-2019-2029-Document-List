//
//  CollectionCell.swift
//  Base Project
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

open class CollectionCell: UICollectionViewCell, TableCellRepresentable {
    
    // MARK: - Identifier
    class public var identifier: String {
        return String.className(self)
    }
    
    // MARK: - Props
    public var model: TableCellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Initialization
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup functions
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    open func setupView() { }
    
    open func updateViews() { }
    
    open func setHighlighted() { }
    
    open func setSelected() { }
    
}
