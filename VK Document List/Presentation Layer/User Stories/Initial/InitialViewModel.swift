//
//  InitialViewModel.swift
//  VK Document List
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import VK_ios_sdk

protocol InitialViewModelInput {
    func configure(with data: Any?)
}

class InitialViewModel {

    // MARK: - Props

    // MARK: - Initialization
    init() { }

    // MARK: - Public functions
    public func auth(completion: (Error?) -> Void) {
        
    }

}

// MARK: - Module functions
extension InitialViewModel { }

// MARK: - InitialViewModelInput
extension InitialViewModel: InitialViewModelInput {

    func configure(with data: Any?) { }

}
