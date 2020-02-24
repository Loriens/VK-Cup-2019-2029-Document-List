//
//  InitialViewController.swift
//  VK Document List
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit
import VK_ios_sdk

class InitialViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Props
    var viewModel: InitialViewModel?
    var router: InitialRouterInput?
    
    private var vkSdkInstance = VKSdk.initialize(withAppId: AppConfiguration.vkAppId)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        applyStyles()
    }
    
}

// MARK: - Setup functions
extension InitialViewController {
    
    func setupComponents() {
        navigationItem.title = "".localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        vkSdkInstance?.register(self)
        vkSdkInstance?.uiDelegate = self
        
        viewModel?.auth(completion: { [weak self] (error) in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            self?.authSucceeded()
        })
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController {
    
    private func authSucceeded() {
//        router?.setDocumentListViewController()
    }
    
}

// MARK: - VKSdkDelegate
extension InitialViewController: VKSdkDelegate {
    
    func vkSdkUserAuthorizationFailed() {
        print("Error: VK Auth failed")
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        guard result != nil else { return }
        viewModel?.auth(completion: { [weak self] (error) in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            self?.authSucceeded()
        })
    }
    
    func vkSdkAccessAuthorizationFinishedWithResult(result: VKAuthorizationResult?) {
        print("VK Result")
    }
    
}

// MARK: - VKSdkUIDelegate
extension InitialViewController: VKSdkUIDelegate {
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        router?.presentViewController(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("VKSdk need captcha")
    }
    
}
