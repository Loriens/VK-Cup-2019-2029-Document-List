//
//  SafariViewModel.swift
//  VK Document List
//
//  Created by Vladislav on 24.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

protocol SafariViewModelInput {
    func configure(with data: Any?)
}

class SafariViewModel {

    // MARK: - Props
    var documentItem: DocumentItem?

    // MARK: - Initialization
    init() { }

    // MARK: - Public functions

}

// MARK: - Module functions
extension SafariViewModel { }

// MARK: - SafariViewModelInput
extension SafariViewModel: SafariViewModelInput {

    func configure(with data: Any?) {
        if let documentItem = data as? DocumentItem {
            self.documentItem = documentItem
        }
    }

}
