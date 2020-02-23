//
//  DocumentListViewModel.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

protocol DocumentListViewModelInput {
    func configure(with data: Any?)
}

class DocumentListViewModel {

    // MARK: - Props

    // MARK: - Initialization
    init() { }

    // MARK: - Public functions

}

// MARK: - Module functions
extension DocumentListViewModel { }

// MARK: - DocumentListViewModelInput
extension DocumentListViewModel: DocumentListViewModelInput {

    func configure(with data: Any?) { }

}
