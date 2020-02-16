//
//  TableCell.swift
//  Base Project
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

public protocol TableCellRepresentable {
    var model: TableCellIdentifiable? { get set }
}

open class TableCell: UITableViewCell, TableCellRepresentable {
    
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
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Setup functions
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    open func setupView() { }
    
    open func updateViews() { }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    override open func setSelected(_ selected: Bool, animated: Bool) { }
    
}
