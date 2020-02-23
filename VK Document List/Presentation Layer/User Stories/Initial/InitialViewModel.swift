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
    private var keychainService = KeychainService()

    // MARK: - Initialization
    init() { }

    // MARK: - Public functions
    public func auth(completion: @escaping (Error?) -> Void) {
        let vkPermissions = ["docs"]
        VKSdk.wakeUpSession(vkPermissions) { state, error in
            guard error == nil else {
                completion(error)
                return
            }
            
            if state == .authorized {
                completion(nil)
            } else {
                VKSdk.authorize(vkPermissions, with: [VKAuthorizationOptions.unlimitedToken, VKAuthorizationOptions.disableSafariController])
            }
        }
    }

}

// MARK: - Module functions
extension InitialViewModel { }

// MARK: - InitialViewModelInput
extension InitialViewModel: InitialViewModelInput {

    func configure(with data: Any?) { }

}
