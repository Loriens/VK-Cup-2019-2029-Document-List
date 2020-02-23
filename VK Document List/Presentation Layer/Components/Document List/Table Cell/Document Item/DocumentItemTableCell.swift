//
//  DocumentItemTableCell.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

class DocumentItemTableCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var previewImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        applyStyles()
    }
    
    // MARK: - Props
    
    // MARK: - Setup functions
    override func setupView() {
        setupActions()
    }
    
    override func updateViews() {
        guard let model = model as? DocumentItemCellModel else { return }
        
        previewImageView.image = AppAssets.placeholderDocumentBook72
        applyStyles()
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - Module functions
    
}

// MARK: - Actions
extension DocumentItemTableCell { }
