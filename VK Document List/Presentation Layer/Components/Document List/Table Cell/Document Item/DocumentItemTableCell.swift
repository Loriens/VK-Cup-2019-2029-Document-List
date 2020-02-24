//
//  DocumentItemTableCell.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

protocol DocumentItemTableCellOutput: AnyObject {
    func documentItemMoreButtonPressed(with documentItem: DocumentItem)
}

class DocumentItemTableCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var moreButton: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Props
    weak var output: DocumentItemTableCellOutput?
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        applyStyles()
    }
    
    // MARK: - Setup functions
    override func setupView() {
        setupActions()
    }
    
    override func updateViews() {
        guard let model = model as? DocumentItemCellModel else { return }
        let doc = model.documentItem
        
        titleLabel.text = doc.title
        var description = ""
        if !doc.ext.isEmpty {
            description += doc.ext.uppercased() + " · "
        }
        description += doc.date.toLocalDateString()
        descriptionLabel.text = description
        switch doc.type {
        case .textDocuments:
            previewImageView.image = AppAssets.placeholderDocumentText72
        case .archives:
            previewImageView.image = AppAssets.placeholderDocumentArchive72
        case .gif:
            break
        case .images:
            previewImageView.image = AppAssets.placeholderDocumentImage72
        case .audio:
            previewImageView.image = AppAssets.placeholderDocumentMusic72
        case .video:
            previewImageView.image = AppAssets.placeholderDocumentVideo72
        case .eBooks:
            previewImageView.image = AppAssets.placeholderDocumentBook72
        case .unknown:
            previewImageView.image = AppAssets.placeholderDocumentOther72
        default:
            break
        }
        moreButton.setTitle("".localized, for: .normal)
        
        applyStyles()
    }
    
    func setupActions() {
        moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
    }
    
    func applyStyles() {
        previewImageView.apply(.roundedStyle(radius: 6))
        titleLabel.apply(.cellTitleStyle())
        descriptionLabel.apply(.cellDescriptionStyle())
        moreButton.setImage(AppAssets.moreHorizontal16, for: .normal)
    }
    
    // MARK: - Module functions
    
}

// MARK: - Actions
extension DocumentItemTableCell {
    
    @objc
    func moreButtonPressed() {
        guard let model = model as? DocumentItemCellModel else { return }
        output?.documentItemMoreButtonPressed(with: model.documentItem)
    }
    
}
